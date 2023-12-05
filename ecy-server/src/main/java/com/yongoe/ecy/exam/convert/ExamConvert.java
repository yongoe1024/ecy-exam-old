package com.yongoe.ecy.exam.convert;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.controller.vo.req.ExamReq;
import com.yongoe.ecy.exam.controller.vo.res.ExamRes;
import com.yongoe.ecy.exam.entity.Exam;
import org.mapstruct.Mapper;

import java.util.List;

/**
 * 考试管理 convert
 *
 * @author yongoe
 * @since 2023/11/30
 */
@Mapper(componentModel = "spring")
public interface ExamConvert {
    /**
     * entity to vo
     */
    ExamReq entity2Req(Exam entity);

    ExamRes entity2Res(Exam entity);

    /**
     * entity to vo List
     */
    List<ExamReq> entity2ReqList(List<Exam> list);

    List<ExamRes> entity2ResList(List<Exam> list);

    /**
     * entity to vo Page
     */
    Page<ExamRes> entity2ResPage(Page<Exam> page);

    /**
     * vo to entity
     */
    Exam req2Entity(ExamReq req);


}