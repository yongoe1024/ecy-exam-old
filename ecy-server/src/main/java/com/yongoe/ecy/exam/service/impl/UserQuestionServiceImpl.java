package com.yongoe.ecy.exam.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.entity.UserQuestion;
import com.yongoe.ecy.exam.mapper.UserQuestionMapper;
import com.yongoe.ecy.exam.service.UserQuestionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户-题目
 *
 * @author yongoe
 * @since 2023/12/04
 */
@Service
public class UserQuestionServiceImpl extends ServiceImpl<UserQuestionMapper, UserQuestion> implements UserQuestionService {

    @Override
    public Page<UserQuestion> getUserQuestionByPage(Page<UserQuestion> page, UserQuestion userQuestion) {
       return baseMapper.getUserQuestionByPage(page, userQuestion);
    }

}
