package com.yongoe.ecy.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.ecy.exam.entity.ExamQuestion;
import com.yongoe.ecy.exam.entity.Question;

import java.util.List;

/**
 * 考试-题目
 *
 * @author yongoe
 * @since 2023/12/04
 */
public interface ExamQuestionService extends IService<ExamQuestion> {

    Page<ExamQuestion> getExamQuestionByPage(Page<ExamQuestion> page, ExamQuestion examQuestion);



}
