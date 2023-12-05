package com.yongoe.ecy.exam.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.entity.ExamDept;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

/**
 * 考试-部门
 *
 * @author yongoe
 * @since 2023/12/04
 */
@Mapper
public interface ExamDeptMapper extends BaseMapper<ExamDept> {

    Page<ExamDept> getExamDeptByPage(Page<ExamDept> page, @Param("examDept") ExamDept examDept);

}
