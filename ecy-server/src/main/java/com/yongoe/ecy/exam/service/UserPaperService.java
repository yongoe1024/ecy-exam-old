package com.yongoe.ecy.exam.service;

import com.yongoe.ecy.exam.controller.vo.excel.UserPaperExcel;
import com.yongoe.ecy.exam.controller.vo.req.SubmitScoreReq;
import com.yongoe.ecy.exam.entity.QuestionOption;
import com.yongoe.ecy.exam.entity.UserPaper;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;
import java.util.Map;

/**
 * 用户-考试
 *
 * @author yongoe
 * @since 2023/12/04
 */
public interface UserPaperService extends IService<UserPaper> {

    Page<UserPaper> getUserPaperByPage(Page<UserPaper> page, UserPaper userPaper);

    Page<UserPaper> checkPaper(Page<UserPaper> page, UserPaper userPaper);


    /**
     * 考试页面，获取信息
     */
    UserPaper getExamInfo(Long examId);

    /**
     * 考试页面,获取题目
     */
    Map<String, Object> getQuestion(Long examId);

    Map<String, Object> getQuestionByUserId(Long examId,Long userId);

    void handPaper(Long examId);

    void handPaperByUserId(Long examId,Long userId);

    /**
     * 批阅分数
     */
    void submitScore(Long examId,Long userId,List<SubmitScoreReq> scoreReq);

    List<UserPaperExcel> export(Long examId);

    List<QuestionOption> getAnswer(Long questionId);
}
