package com.yongoe.ecy.exam.service;

import com.yongoe.ecy.exam.entity.UserQuestion;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import java.util.List;

/**
 * 用户-题目
 *
 * @author yongoe
 * @since 2023/12/04
 */
public interface UserQuestionService extends IService<UserQuestion> {

    Page<UserQuestion> getUserQuestionByPage(Page<UserQuestion> page, UserQuestion userQuestion);

}
