package com.yongoe.ecy.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.ecy.exam.entity.ExamUser;

/**
 * 考试-用户
 *
 * @author yongoe
 * @since 2023/12/04
 */
public interface ExamUserService extends IService<ExamUser> {

    Page<ExamUser> getExamUserByPage(Page<ExamUser> page, ExamUser examUser);

}
