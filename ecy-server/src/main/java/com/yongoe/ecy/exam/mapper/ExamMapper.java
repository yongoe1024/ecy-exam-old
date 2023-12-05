package com.yongoe.ecy.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.entity.Exam;
import com.yongoe.ecy.exam.entity.Question;
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
     * 根据考试id获取题目
     */
    @Select("SELECT e_question.*,e_exam_question.score FROM e_question LEFT JOIN e_exam_question ON e_question.id = e_exam_question.question_id WHERE e_question.type=#{type} AND e_question.id IN (SELECT question_id FROM e_exam_question WHERE exam_id = #{examId} ) ORDER BY e_question.TYPE")
    List<Question> getQuestionByExamId(@Param("examId") Long examId, @Param("type") String type);

}
