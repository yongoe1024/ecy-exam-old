package com.yongoe.ecy.exam.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.ecy.exam.entity.ExamQuestion;
import com.yongoe.ecy.exam.entity.Question;
import com.yongoe.ecy.exam.mapper.ExamQuestionMapper;
import com.yongoe.ecy.exam.service.ExamQuestionService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 考试-题目
 *
 * @author yongoe
 * @since 2023/12/04
 */
@Service
public class ExamQuestionServiceImpl extends ServiceImpl<ExamQuestionMapper, ExamQuestion> implements ExamQuestionService {

    @Override
    public Page<ExamQuestion> getExamQuestionByPage(Page<ExamQuestion> page, ExamQuestion examQuestion) {
        return baseMapper.getExamQuestionByPage(page, examQuestion);
    }

}
