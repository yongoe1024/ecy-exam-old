package com.yongoe.ecy.exam.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.LambdaUpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.controller.vo.req.UserQuestionReq;
import com.yongoe.ecy.exam.controller.vo.res.UserQuestionRes;
import com.yongoe.ecy.exam.convert.UserQuestionConvert;
import com.yongoe.ecy.exam.entity.UserPaper;
import com.yongoe.ecy.exam.entity.UserQuestion;
import com.yongoe.ecy.exam.service.UserPaperService;
import com.yongoe.ecy.exam.service.UserQuestionService;
import com.yongoe.ecy.utils.PageUtils;
import com.yongoe.ecy.utils.R;
import com.yongoe.ecy.utils.UserUtils;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * 用户-题目
 *
 * @author yongoe
 * @since 2023/12/04
 */
@Tag(name = "用户-题目")
@RestController
@RequestMapping("/exam/userquestion")
public class UserQuestionController {
    @Resource
    private UserQuestionService userQuestionService;
    @Resource
    private UserPaperService userPaperService;

    @Operation(summary = "答题")
    @PostMapping("/answer")
    public R answer(@RequestBody Map map) {
        Long userId = UserUtils.getUserId();
        String answer = (String) map.get("answer");
        String examId = (String) map.get("examId");
        String questionId = (String) map.get("questionId");
        UserPaper userPaper = userPaperService.getOne(new LambdaQueryWrapper<UserPaper>()
                .eq(UserPaper::getUserId, userId)
                .eq(UserPaper::getExamId, examId));
        String status = userPaper.getStatus();
        if("5".equals(status)){
            return R.error("已交卷，不能再答题");
        }else if("4".equals(status) || "3".equals(status)){
            return R.error("已超时，不能再答题");
        }
        UserQuestion userQuestion = new UserQuestion();
        userQuestion.setExamId(Long.valueOf(examId));
        userQuestion.setQuestionId(Long.valueOf(questionId));
        userQuestion.setUserId(userId);
        userQuestionService.update(new LambdaUpdateWrapper<>(userQuestion).set(UserQuestion::getAnswer, answer));
        return R.success();
    }

}