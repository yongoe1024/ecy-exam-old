package com.yongoe.ecy.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.entity.QuestionOption;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 题目选项
 *
 * @author yongoe
 * @since 2023/11/30
 */
@Mapper
public interface QuestionOptionMapper extends BaseMapper<QuestionOption> {

    Page<QuestionOption> getQuestionOptionByPage(Page<QuestionOption> page, @Param("questionOption") QuestionOption questionOption);

}
