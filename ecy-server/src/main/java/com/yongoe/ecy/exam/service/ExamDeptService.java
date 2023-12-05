package com.yongoe.ecy.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.ecy.exam.entity.ExamDept;

/**
 * 考试-部门
 *
 * @author yongoe
 * @since 2023/12/04
 */
public interface ExamDeptService extends IService<ExamDept> {

    Page<ExamDept> getExamDeptByPage(Page<ExamDept> page, ExamDept examDept);

}
