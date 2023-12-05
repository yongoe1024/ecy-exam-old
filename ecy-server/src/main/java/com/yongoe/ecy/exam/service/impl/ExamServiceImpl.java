package com.yongoe.ecy.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.ecy.basic.entity.Department;
import com.yongoe.ecy.basic.service.DepartmentService;
import com.yongoe.ecy.exam.controller.vo.req.makePaper.*;
import com.yongoe.ecy.exam.entity.*;
import com.yongoe.ecy.exam.mapper.ExamMapper;
import com.yongoe.ecy.exam.mapper.ExamQuestionMapper;
import com.yongoe.ecy.exam.service.*;
import com.yongoe.ecy.system.entity.User;
import com.yongoe.ecy.system.service.UserService;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 考试管理
 *
 * @author yongoe
 * @since 2023/11/30
 */
@Service
public class ExamServiceImpl extends ServiceImpl<ExamMapper, Exam> implements ExamService {
    @Resource
    private QuestionService questionService;
    @Resource
    private ExamDeptService examDeptService;
    @Resource
    private ExamQuestionService examQuestionService;
    @Resource
    private ExamUserService examUserService;
    @Resource
    private UserPaperService userPaperService;
    @Resource
    private UserQuestionService userQuestionService;
    @Resource
    private UserService userService;
    @Resource
    private DepartmentService departmentService;
    @Resource
    private ExamQuestionMapper examQuestionMapper;

    @Override
    public Map<String, Object> getExamInfo(Long examId) {
        Exam exam = baseMapper.selectById(examId);
        if (exam == null) {
            return null;
        }
        HashMap<String, Integer> config = new HashMap<>();
        HashMap<String, Object> auth = new HashMap<>();
        HashMap<String, Object> question = new HashMap<>();
        //配置
        config.put("passScore", exam.getPassScore());
        config.put("totalScore", exam.getTotalScore());
        //权限
        if ("1".equals(exam.getOpenType())) {
            auth.put("openType", "全部开放");
        } else if ("2".equals(exam.getOpenType())) {
            auth.put("openType", "部门开放");
            List<Long> deptIds = examDeptService.list(new LambdaQueryWrapper<ExamDept>().eq(ExamDept::getExamId, examId)).stream().map(ExamDept::getDepartmentId).toList();
            if (deptIds.isEmpty()) {
                throw new RuntimeException("部门不应该为空");
            }
            List<String> list = departmentService.listByIds(deptIds).stream().map(Department::getName).toList();
            auth.put("examDeptList", list);
        } else if ("3".equals(exam.getOpenType())) {
            auth.put("openType", "指定开放");
            List<Long> userIds = examUserService.list(new LambdaQueryWrapper<ExamUser>().eq(ExamUser::getExamId, examId)).stream().map(ExamUser::getUserId).toList();
            if (userIds.isEmpty()) {
                throw new RuntimeException("用户不应该为空");
            }
            List<String> list1 = userService.listByIds(userIds).stream().map(User::getName).toList();
            auth.put("examUserList", list1);
        }
        //题目
        List<Question> singleChoice = baseMapper.getQuestionByExamId(examId, "单选");
        List<Question> multipleChoice = baseMapper.getQuestionByExamId(examId, "多选");
        List<Question> trueFalse = baseMapper.getQuestionByExamId(examId, "判断");
        List<Question> shortAnswer = baseMapper.getQuestionByExamId(examId, "简答");
        question.put("singleChoice", singleChoice);
        question.put("multipleChoice", multipleChoice);
        question.put("trueFalse", trueFalse);
        question.put("shortAnswer", shortAnswer);
        HashMap<String, Object> map = new HashMap<>();
        map.put("config", config);
        map.put("auth", auth);
        map.put("question", question);
        return map;
    }


    @Transactional(rollbackFor = Exception.class)
    @Override
    public void makepaper(Long examId, MakePaperReq makePaper) {
        AuthForm authForm = makePaper.getAuthForm();
        ConfigForm configForm = makePaper.getConfigForm();
        BankForm bankForm = makePaper.getBankForm();
        config(examId, configForm, authForm);
        auth(examId, authForm);
        question(examId, bankForm);
        issue(examId);
    }

    /**
     * 分发试卷，第四个执行
     */
    private void issue(Long examId) {
        //1:未组卷 2:未开始 3:进行中 4:已结束
        Exam exam = baseMapper.selectById(examId);
        String status = "2";
        //判断是否到了考试时间
        if (exam.getStartTime().isBefore(LocalDateTime.now())) {
            status = "3";
        }
        // 先设置下考试再发题
        exam.setStatus(status);
        baseMapper.updateById(exam);
        // 发题
        String openType = exam.getOpenType();
        List<ExamQuestion> examQuestionList = examQuestionService.list(new LambdaQueryWrapper<ExamQuestion>().eq(ExamQuestion::getExamId, examId));
        if ("1".equals(openType)) {
            //全部开放
            for (User user : userService.list()) {
                createPaper(examId, examQuestionList, user.getId());
            }
        } else if ("2".equals(openType)) {
            //部门开放
            for (Long departmentId : examDeptService.list(new LambdaQueryWrapper<ExamDept>().eq(ExamDept::getExamId, examId)).stream().map(ExamDept::getDepartmentId).toList()) {
                for (User user : userService.list(new LambdaQueryWrapper<User>().eq(User::getDepartmentId, departmentId))) {
                    createPaper(examId, examQuestionList, user.getId());
                }
            }
        } else if ("3".equals(openType)) {
            //指定开放
            for (Long userId : examUserService.list(new LambdaQueryWrapper<ExamUser>().eq(ExamUser::getExamId, examId)).stream().map(ExamUser::getUserId).toList()) {
                createPaper(examId, examQuestionList, userId);
            }
        } else {
            throw new RuntimeException("开放类型错误");
        }
    }

    /**
     * 生成试卷题目，第三个执行
     */
    private void question(Long examId, BankForm bankForm) {
        for (BankList bankList : bankForm.getBankList()) {
            if (bankList.getIsAutoSelect()) {
                //自动选题
                random(bankList);
            } else {
                // 手动选题
                for (Long questionId : bankList.getQuestionIdList()) {
                    ExamQuestion examQuestion = new ExamQuestion();
                    String type = questionService.getById(questionId).getType();
                    //配置分数
                    if ("单选".equals(type)) {
                        examQuestion.setScore(bankList.getSingleChoiceScore());
                    } else if ("多选".equals(type)) {
                        examQuestion.setScore(bankList.getMultipleChoiceScore());
                    } else if ("判断".equals(type)) {
                        examQuestion.setScore(bankList.getTrueFalseScore());
                    } else if ("简答".equals(type)) {
                        examQuestion.setScore(bankList.getShortAnswerScore());
                    } else {
                        throw new RuntimeException("题目类型错误");
                    }
                    examQuestion.setExamId(examId);
                    examQuestion.setQuestionId(questionId);
                    examQuestionService.save(examQuestion);
                }
            }
        }
    }

    /**
     * 授权，第二个执行
     */
    private void auth(Long examId, AuthForm authForm) {
        String openType = authForm.getOpenType();
        if ("1".equals(openType)) {
            //全部开放
        } else if ("2".equals(openType)) {
            //部门开放
            for (Long aLong : authForm.getDepartmenIdtList()) {
                ExamDept examDept = new ExamDept();
                examDept.setExamId(examId);
                examDept.setDepartmentId(aLong);
                examDeptService.save(examDept);
            }
        } else if ("3".equals(openType)) {
            //指定开放
            for (Long aLong : authForm.getUserIdList()) {
                ExamUser examUser = new ExamUser();
                examUser.setExamId(examId);
                examUser.setUserId(aLong);
                examUserService.save(examUser);
            }
        } else {
            throw new RuntimeException("开放类型错误");
        }
    }

    /**
     * 配置分数，保存开放类型字段，第一个执行
     */
    private void config(Long examId, ConfigForm configForm, AuthForm authForm) {
        Integer passScore = configForm.getPassScore();
        Integer totalScore = configForm.getTotalScore();
        Exam exam = baseMapper.selectById(examId);
        exam.setPassScore(passScore);
        exam.setTotalScore(totalScore);
        exam.setOpenType(authForm.getOpenType());
        baseMapper.updateById(exam);
    }

    @Override
    public Page<Exam> getExamByPage(Page<Exam> page, Exam exam) {
        return baseMapper.getExamByPage(page, exam);
    }

    @Override
    public void removeAllInfo(Long id) {
        baseMapper.deleteById(id);
        examDeptService.remove(new LambdaQueryWrapper<ExamDept>().eq(ExamDept::getExamId, id));
        examUserService.remove(new LambdaQueryWrapper<ExamUser>().eq(ExamUser::getExamId, id));
        examQuestionService.remove(new LambdaQueryWrapper<ExamQuestion>().eq(ExamQuestion::getExamId, id));
        userPaperService.remove(new LambdaQueryWrapper<UserPaper>().eq(UserPaper::getExamId, id));
        userQuestionService.remove(new LambdaQueryWrapper<UserQuestion>().eq(UserQuestion::getExamId, id));
    }

    /**
     * 生成试卷
     */
    private void createPaper(Long examId, List<ExamQuestion> examQuestionList, Long userId) {
        UserPaper userPaper = new UserPaper();
        userPaper.setExamId(examId);
        userPaper.setUserId(userId);
        userPaper.setStatus("1");
        userPaperService.save(userPaper);
        for (ExamQuestion examQuestion : examQuestionList) {
            UserQuestion userQuestion = new UserQuestion();
            userQuestion.setExamId(examId);
            userQuestion.setQuestionId(examQuestion.getQuestionId());
            userQuestion.setUserId(userId);
            userQuestionService.save(userQuestion);
        }
    }

    /**
     * 试卷选题-随机抽题
     */
    private void random(BankList bankList) {
        long bankId = bankList.getBankId();
        List<Long> singleList = baseMapper.randomQuestion(bankId, "单选", bankList.getSingleChoice());
        List<Long> multipleList = baseMapper.randomQuestion(bankId, "多选", bankList.getMultipleChoice());
        List<Long> trueFalseList = baseMapper.randomQuestion(bankId, "判断", bankList.getTrueFalse());
        List<Long> shortAnswerList = baseMapper.randomQuestion(bankId, "简答", bankList.getShortAnswer());
        for (Long questionId : singleList) {
            ExamQuestion examQuestion = createExamQuestion(bankList.getBankId(), questionId, bankList.getSingleChoiceScore());
            examQuestionService.save(examQuestion);
        }
        for (Long questionId : multipleList) {
            ExamQuestion examQuestion = createExamQuestion(bankList.getBankId(), questionId, bankList.getMultipleChoiceScore());
            examQuestionService.save(examQuestion);
        }
        for (Long questionId : trueFalseList) {
            ExamQuestion examQuestion = createExamQuestion(bankList.getBankId(), questionId, bankList.getTrueFalseScore());
            examQuestionService.save(examQuestion);
        }
        for (Long questionId : shortAnswerList) {
            ExamQuestion examQuestion = createExamQuestion(bankList.getBankId(), questionId, bankList.getShortAnswerScore());
            examQuestionService.save(examQuestion);
        }
    }

    private ExamQuestion createExamQuestion(Long examId, Long questionId, Integer score) {
        ExamQuestion examQuestion = new ExamQuestion();
        examQuestion.setExamId(examId);
        examQuestion.setQuestionId(questionId);
        examQuestion.setScore(score);
        return examQuestion;
    }

}
