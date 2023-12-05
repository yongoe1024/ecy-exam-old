package com.yongoe.ecy.exam.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.entity.UserQuestion;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 用户-题目
 *
 * @author yongoe
 * @since 2023/12/04
 */
@Mapper
public interface UserQuestionMapper extends BaseMapper<UserQuestion> {

    Page<UserQuestion> getUserQuestionByPage(Page<UserQuestion> page, @Param("userQuestion") UserQuestion userQuestion);

}
