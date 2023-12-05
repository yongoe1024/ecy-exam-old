package com.yongoe.ecy.exam.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.ecy.exam.entity.QuestionOption;
import com.yongoe.ecy.exam.mapper.QuestionOptionMapper;
import com.yongoe.ecy.exam.service.QuestionOptionService;
import org.springframework.stereotype.Service;

/**
 * 题目选项
 *
 * @author yongoe
 * @since 2023/11/30
 */
@Service
public class QuestionOptionServiceImpl extends ServiceImpl<QuestionOptionMapper, QuestionOption> implements QuestionOptionService {

    @Override
    public Page<QuestionOption> getQuestionOptionByPage(Page<QuestionOption> page, QuestionOption questionOption) {
        return baseMapper.getQuestionOptionByPage(page, questionOption);
    }

}
