package com.yongoe.ecy.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.entity.Exam;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 考试管理
 *
 * @author yongoe
 * @since 2023/11/30
 */
@Mapper
public interface ExamMapper extends BaseMapper<Exam> {

    Page<Exam> getExamByPage(Page<Exam> page, @Param("exam") Exam exam);

    /**
     * 随机抽取试题
     */
    @Select("SELECT `id`    FROM `e_question`    WHERE     question_bank_id=#{bankId} AND TYPE= #{type}   ORDER BY RAND()     LIMIT #{num};")
    List<Long> randomQuestion(@Param("bankId") Long bankId, @Param("type") String type, @Param("num") Integer num);

    /**
     * 根据考试id获取题目s
     */
    @Select("SELECT COUNT(*) FROM e_exam_question LEFT join e_question ON e_question.id = e_exam_question.question_id WHERE  e_question.type = #{type} AND  e_exam_question.exam_id =#{examId} ")
    Long getQuestionByExamId(@Param("examId") Long examId, @Param("type") String type);

}
