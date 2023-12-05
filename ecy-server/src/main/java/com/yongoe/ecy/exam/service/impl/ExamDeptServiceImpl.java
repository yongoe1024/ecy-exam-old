package com.yongoe.ecy.exam.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.ecy.exam.entity.ExamDept;
import com.yongoe.ecy.exam.mapper.ExamDeptMapper;
import com.yongoe.ecy.exam.service.ExamDeptService;
import org.springframework.stereotype.Service;

/**
 * 考试-部门
 *
 * @author yongoe
 * @since 2023/12/04
 */
@Service
public class ExamDeptServiceImpl extends ServiceImpl<ExamDeptMapper, ExamDept> implements ExamDeptService {

    @Override
    public Page<ExamDept> getExamDeptByPage(Page<ExamDept> page, ExamDept examDept) {
        return baseMapper.getExamDeptByPage(page, examDept);
    }

}
