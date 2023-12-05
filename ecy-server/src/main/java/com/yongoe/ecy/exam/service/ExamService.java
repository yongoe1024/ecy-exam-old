package com.yongoe.ecy.exam.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yongoe.ecy.exam.controller.vo.req.makePaper.MakePaperReq;
import com.yongoe.ecy.exam.entity.Exam;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 考试管理
 *
 * @author yongoe
 * @since 2023/11/30
 */
public interface ExamService extends IService<Exam> {

    Page<Exam> getExamByPage(Page<Exam> page, Exam exam);

    /**
     * 组卷
     */
    void makepaper(Long examId, MakePaperReq makePaper);

    /**
     * 考试详情
     */
    Map<String, Object> getExamInfo(Long examId);

    /**
     * 彻底删除考试
     */
    void removeAllInfo(Long id);
}
