package com.yongoe.ecy.exam.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.controller.vo.excel.UserPaperExcel;
import com.yongoe.ecy.exam.entity.Question;
import com.yongoe.ecy.exam.entity.UserPaper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 用户-考试
 *
 * @author yongoe
 * @since 2023/12/04
 */
@Mapper
public interface UserPaperMapper extends BaseMapper<UserPaper> {

    Page<UserPaper> getUserPaperByPage(Page<UserPaper> page, @Param("userPaper") UserPaper userPaper);


    /**
     * 根据考试id获取题目和学生题目信息
     */
    List<Question> getQuestionByExamId(@Param("examId") Long examId,@Param("userId") Long userId, @Param("type") String type);

    List<UserPaperExcel> export(Long examId);
}
