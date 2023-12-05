package com.yongoe.ecy.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.ecy.exam.controller.vo.excel.UserPaperExcel;
import com.yongoe.ecy.exam.controller.vo.req.SubmitScoreReq;
import com.yongoe.ecy.exam.convert.QuestionConvert;
import com.yongoe.ecy.exam.entity.Exam;
import com.yongoe.ecy.exam.entity.Question;
import com.yongoe.ecy.exam.entity.UserPaper;
import com.yongoe.ecy.exam.entity.UserQuestion;
import com.yongoe.ecy.exam.mapper.UserPaperMapper;
import com.yongoe.ecy.exam.service.ExamService;
import com.yongoe.ecy.exam.service.UserPaperService;
import com.yongoe.ecy.exam.service.UserQuestionService;
import com.yongoe.ecy.utils.UserUtils;
import jakarta.annotation.Resource;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户-考试
 *
 * @author yongoe
 * @since 2023/12/04
 */
@Service
public class UserPaperServiceImpl extends ServiceImpl<UserPaperMapper, UserPaper> implements UserPaperService {
    @Resource
    private QuestionConvert questionConvert;
    @Resource
    private UserQuestionService userQuestionService;
    @Lazy
    @Resource
    private ExamService examService;

    @Override
    public Page<UserPaper> getUserPaperByPage(Page<UserPaper> page, UserPaper userPaper) {
        Long userId = UserUtils.getUserId();
        userPaper.setUserId(userId);
        return baseMapper.getUserPaperByPage(page, userPaper);
    }

    @Override
    public Page<UserPaper> checkPaper(Page<UserPaper> page, UserPaper userPaper) {
        return baseMapper.getUserPaperByPage(page, userPaper);
    }

    @Override
    public Map<String, Object> getQuestion(Long examId) {
        Long userId = UserUtils.getUserId();
        List<Question> singleChoice = baseMapper.getQuestionByExamId(examId, userId, "单选");
        List<Question> multipleChoice = baseMapper.getQuestionByExamId(examId, userId, "多选");
        List<Question> trueFalse = baseMapper.getQuestionByExamId(examId, userId, "判断");
        List<Question> shortAnswer = baseMapper.getQuestionByExamId(examId, userId, "简答");
        HashMap<String, Object> map = new HashMap<>();
        map.put("singleChoice", questionConvert.entity2ResList(singleChoice));
        map.put("multipleChoice", questionConvert.entity2ResList(multipleChoice));
        map.put("trueFalse", questionConvert.entity2ResList(trueFalse));
        map.put("shortAnswer", questionConvert.entity2ResList(shortAnswer));
        return map;
    }

    @Override
    public Map<String, Object> getQuestionByUserId(Long examId, Long userId) {
        List<Question> singleChoice = baseMapper.getQuestionByExamId(examId, userId, "单选");
        List<Question> multipleChoice = baseMapper.getQuestionByExamId(examId, userId, "多选");
        List<Question> trueFalse = baseMapper.getQuestionByExamId(examId, userId, "判断");
        List<Question> shortAnswer = baseMapper.getQuestionByExamId(examId, userId, "简答");
        HashMap<String, Object> map = new HashMap<>();
        map.put("singleChoice", questionConvert.entity2ResList(singleChoice));
        map.put("multipleChoice", questionConvert.entity2ResList(multipleChoice));
        map.put("trueFalse", questionConvert.entity2ResList(trueFalse));
        map.put("shortAnswer", questionConvert.entity2ResList(shortAnswer));
        return map;
    }

    @Override
    public void handPaper(Long examId) {
        Long userId = UserUtils.getUserId();
        UserPaper userPaper = baseMapper.selectOne(new LambdaQueryWrapper<UserPaper>()
                .eq(UserPaper::getUserId, userId)
                .eq(UserPaper::getExamId, examId));
        userPaper.setStatus("5");
        userPaper.setFinishTime(LocalDateTime.now());
        baseMapper.updateById(userPaper);
    }

    @Override
    public void handPaperByUserId(Long examId, Long userId) {
        UserPaper userPaper = baseMapper.selectOne(new LambdaQueryWrapper<UserPaper>()
                .eq(UserPaper::getUserId, userId)
                .eq(UserPaper::getExamId, examId));
        userPaper.setStatus("5");
        userPaper.setFinishTime(LocalDateTime.now());
        baseMapper.updateById(userPaper);
    }

    @Override
    public void submitScore(Long examId, Long userId, List<SubmitScoreReq> scoreReq) {
        double sum = 0.0;
        for (SubmitScoreReq req : scoreReq) {
            UserQuestion one = userQuestionService.getOne(new LambdaQueryWrapper<UserQuestion>()
                    .eq(UserQuestion::getExamId, examId)
                    .eq(UserQuestion::getQuestionId, req.getId())
                    .eq(UserQuestion::getUserId, userId));
            one.setScore(Double.valueOf(req.getMyScore()));
            one.setIsTrue(req.getScore().equals(req.getMyScore()));
            userQuestionService.updateById(one);
            sum += Double.parseDouble(req.getMyScore());
        }
        //计算分数，更新userPaper
        Exam exam = examService.getOne(new LambdaQueryWrapper<Exam>().eq(Exam::getId, examId));
        UserPaper userPaper = baseMapper.selectOne(new LambdaQueryWrapper<UserPaper>()
                .eq(UserPaper::getUserId, userId)
                .eq(UserPaper::getExamId, examId));
        userPaper.setScore(sum);
        double passScore = exam.getPassScore();
        if(sum < passScore)
            userPaper.setStatus("3");
        else
            userPaper.setStatus("4");
        baseMapper.updateById(userPaper);
    }

    @Override
    public List<UserPaperExcel> export(Long examId) {
        List<UserPaperExcel> list = baseMapper.export(examId);
        return list;
    }

    @Override
    public UserPaper getExamInfo(Long examId) {
        Long userId = UserUtils.getUserId();
        UserPaper userPaper = new UserPaper();
        userPaper.setUserId(userId);
        userPaper.setExamId(examId);
        firstEnter(userPaper);
        return baseMapper.selectOne(new LambdaQueryWrapper<>(userPaper));
    }

    private void firstEnter(UserPaper userPaper) {
        UserPaper paper = baseMapper.selectOne(new LambdaQueryWrapper<>(userPaper));
        LocalDateTime enterTime = paper.getEnterTime();
        if (enterTime == null) {
            paper.setEnterTime(LocalDateTime.now());
            // 考试中
            paper.setStatus("2");
            baseMapper.updateById(paper);
        }
    }
}
