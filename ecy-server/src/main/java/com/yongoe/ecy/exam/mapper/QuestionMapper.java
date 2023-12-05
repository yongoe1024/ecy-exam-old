package com.yongoe.ecy.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.entity.Question;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 题目管理
 *
 * @author yongoe
 * @since 2023/11/30
 */
@Mapper
public interface QuestionMapper extends BaseMapper<Question> {

    Page<Question> getQuestionByPage(Page<Question> page, @Param("question") Question question);

}
