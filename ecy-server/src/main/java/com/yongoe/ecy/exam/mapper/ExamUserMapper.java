package com.yongoe.ecy.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.entity.ExamUser;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 考试-用户
 *
 * @author yongoe
 * @since 2023/12/04
 */
@Mapper
public interface ExamUserMapper extends BaseMapper<ExamUser> {

    Page<ExamUser> getExamUserByPage(Page<ExamUser> page, @Param("examUser") ExamUser examUser);

}
