package com.yongoe.ecy.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.ecy.exam.entity.QuestionOption;

/**
 * 题目选项
 *
 * @author yongoe
 * @since 2023/11/30
 */
public interface QuestionOptionService extends IService<QuestionOption> {

    Page<QuestionOption> getQuestionOptionByPage(Page<QuestionOption> page, QuestionOption questionOption);

}
