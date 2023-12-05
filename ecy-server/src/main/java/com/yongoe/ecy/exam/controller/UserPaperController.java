package com.yongoe.ecy.exam.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.controller.vo.excel.UserPaperExcel;
import com.yongoe.ecy.exam.controller.vo.req.SubmitScoreReq;
import com.yongoe.ecy.exam.controller.vo.req.UserPaperReq;
import com.yongoe.ecy.exam.controller.vo.res.ExamRes;
import com.yongoe.ecy.exam.controller.vo.res.UserPaperRes;
import com.yongoe.ecy.exam.convert.ExamConvert;
import com.yongoe.ecy.exam.convert.UserPaperConvert;
import com.yongoe.ecy.exam.entity.Exam;
import com.yongoe.ecy.exam.entity.UserPaper;
import com.yongoe.ecy.exam.service.ExamService;
import com.yongoe.ecy.exam.service.UserPaperService;
import com.yongoe.ecy.system.entity.User;
import com.yongoe.ecy.system.service.UserService;
import com.yongoe.ecy.utils.ExcelUtils;
import com.yongoe.ecy.utils.PageUtils;
import com.yongoe.ecy.utils.R;
import com.yongoe.ecy.utils.UserUtils;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 用户-考试
 *
 * @author yongoe
 * @since 2023/12/04
 */
@Tag(name = "用户-考试")
@RestController
@RequestMapping("/exam/userpaper")
public class UserPaperController {
    @Resource
    private UserPaperService userPaperService;
    @Resource
    private UserPaperConvert userPaperConvert;
    @Resource
    private ExamService examService;
    @Resource
    private ExamConvert examConvert;
    @Resource
    private UserService userService;


    @Operation(summary = "交卷")
    @PostMapping("/handPaper")
    public R handPaper(Long examId) {
        userPaperService.handPaper(examId);
        return R.success("成功交卷");
    }

    @Operation(summary = "考试界面获取题目")
    @PostMapping("/question")
    public R getQuestion(Long examId) {
        Map<String, Object> map = userPaperService.getQuestion(examId);
        return R.success().put(map);
    }

    @Operation(summary = "考试页面获取信息")
    @PostMapping("/exam")
    public R exam(Long examId) {
        if (examId == null) {
            return R.error("非法进入");
        }
        Exam exam = examService.getById(examId);
        if (exam == null) {
            return R.error("考试不存在");
        }
        Long userId = UserUtils.getUserId();
        UserPaper one = userPaperService.getOne(new LambdaQueryWrapper<UserPaper>().eq(UserPaper::getExamId, examId).eq(UserPaper::getUserId, userId));
        if (one == null) {
            return R.error("无权访问");
        }
        // 组装其他信息
        UserPaper userPaper = userPaperService.getExamInfo(examId);
        UserPaperRes userPaperRes = userPaperConvert.entity2Res(userPaper);
        userPaperRes.setExamRes(examConvert.entity2Res(exam));
        return R.success().put(userPaperRes);
    }


    @Operation(summary = "批阅获取考生")
    @PostMapping("/checkPaper")
    public R checkPaper(Long current, Long size, @RequestBody UserPaperReq req) {
        UserPaper entity = userPaperConvert.req2Entity(req);
        Page<UserPaper> page = userPaperService.checkPaper(Page.of(current, size), entity);
        Page<UserPaperRes> resPage = userPaperConvert.entity2ResPage(page);
        Page<UserPaperRes> process = processUser(resPage);
        return R.success().put(new PageUtils(process));
    }

    @Operation(summary = "批阅题目")
    @PostMapping("/checkQuestion")
    public R checkQuestion(Long examId, Long userId) {
        Map<String, Object> map = userPaperService.getQuestionByUserId(examId, userId);
        return R.success().put(map);
    }

    @Operation(summary = "提交批阅分数")
    @PostMapping("/submitScore")
    public R submitScore(Long examId, Long userId, @RequestBody List<SubmitScoreReq> scoreReq) {
        userPaperService.submitScore(examId, userId, scoreReq);
        return R.success("批阅完成");
    }

    @Operation(summary = "学生查看考试题目得分")
    @PostMapping("/examQuestionInfo")
    public R examQuestionInfo(Long examId) {
        Long userId = UserUtils.getUserId();
        Map<String, Object> map = userPaperService.getQuestionByUserId(examId, userId);
        return R.success().put(map);
    }

    @Operation(summary = "学生查询考试分页数据")
    @PostMapping("/page")
    public R page(Long current, Long size, @RequestBody UserPaperReq req) {
        UserPaper entity = userPaperConvert.req2Entity(req);
        Page<UserPaper> page = userPaperService.getUserPaperByPage(Page.of(current, size), entity);
        Page<UserPaperRes> resPage = userPaperConvert.entity2ResPage(page);
        Page<UserPaperRes> process = process(resPage);
        return R.success().put(new PageUtils(process));
    }

    @Operation(summary = "导出数据")
    @PostMapping("/export/{examId}")
    public void export(@PathVariable Long examId, HttpServletResponse response) {
        List<UserPaperExcel> excel=  userPaperService.export(examId);
        ExcelUtils.export(response, excel, UserPaperExcel.class);
    }

    /**
     * 处理分页数据
     */
    private Page<UserPaperRes> process(Page<UserPaperRes> page) {
        for (UserPaperRes record : page.getRecords()) {
            Long examId = record.getExamId();
            Exam byId = examService.getById(examId);
            ExamRes examRes = examConvert.entity2Res(byId);
            record.setExamRes(examRes);
        }
        return page;
    }


    /**
     * 处理分页数据
     */
    private Page<UserPaperRes> processUser(Page<UserPaperRes> page) {
        for (UserPaperRes record : page.getRecords()) {
            Long userId = record.getUserId();
            User byId = userService.getById(userId);
            record.setName(byId.getName());
        }
        return page;
    }
}