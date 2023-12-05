package com.yongoe.ecy.exam.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yongoe.ecy.exam.entity.ExamUser;
import com.yongoe.ecy.exam.mapper.ExamUserMapper;
import com.yongoe.ecy.exam.service.ExamUserService;
import org.springframework.stereotype.Service;

/**
 * 考试-用户
 *
 * @author yongoe
 * @since 2023/12/04
 */
@Service
public class ExamUserServiceImpl extends ServiceImpl<ExamUserMapper, ExamUser> implements ExamUserService {

    @Override
    public Page<ExamUser> getExamUserByPage(Page<ExamUser> page, ExamUser examUser) {
        return baseMapper.getExamUserByPage(page, examUser);
    }

}
