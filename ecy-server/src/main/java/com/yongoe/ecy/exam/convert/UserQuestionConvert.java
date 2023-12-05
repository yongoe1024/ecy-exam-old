package com.yongoe.ecy.exam.convert;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.controller.vo.req.UserQuestionReq;
import com.yongoe.ecy.exam.controller.vo.res.UserQuestionRes;
import com.yongoe.ecy.exam.entity.UserQuestion;
import org.mapstruct.Mapper;

import java.util.List;

/**
 * 用户-题目 convert
 *
 * @author yongoe
 * @since 2023/12/04
 */
@Mapper(componentModel = "spring")
public interface UserQuestionConvert {
    /**
     * entity to vo
     */
    UserQuestionReq entity2Req(UserQuestion entity);

    UserQuestionRes entity2Res(UserQuestion entity);

    /**
     * entity to vo List
     */
    List<UserQuestionReq> entity2ReqList(List<UserQuestion> list);

    List<UserQuestionRes> entity2ResList(List<UserQuestion> list);

    /**
     * entity to vo Page
     */
    Page<UserQuestionRes> entity2ResPage(Page<UserQuestion> page);

    /**
     * vo to entity
     */
    UserQuestion req2Entity(UserQuestionReq req);

    /**
     * vo to entity List
     */

}