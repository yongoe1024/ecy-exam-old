package com.yongoe.ecy.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.entity.ExamQuestion;
import com.yongoe.ecy.exam.entity.Question;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 考试-题目
 *
 * @author yongoe
 * @since 2023/12/04
 */
@Mapper
public interface ExamQuestionMapper extends BaseMapper<ExamQuestion> {

    Page<ExamQuestion> getExamQuestionByPage(Page<ExamQuestion> page, @Param("examQuestion") ExamQuestion examQuestion);

}
