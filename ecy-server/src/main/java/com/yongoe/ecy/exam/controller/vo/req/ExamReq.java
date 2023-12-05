package com.yongoe.ecy.exam.controller.vo.req;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 考试管理
 *
 * @author yongoe
 * @since 2023/11/30
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "考试管理Req")
public class ExamReq {

    /**
     *
     */
    private Long id;
    /**
     * 考试名称
     */
    private String examName;
    /**
     * 考试描述
     */
    private String examDesc;
    /**
     * 开放形式
     */
    private String openType;
    /**
     * 考试时长
     */
    private Integer duration;
    /**
     * 考试开始时间
     */
    private LocalDateTime startTime;
    /**
     * 考试结束时间
     */
    private LocalDateTime endTime;
    /**
     * 考试总分
     */
    private Integer totalScore;
    /**
     * 及格分
     */
    private Integer passScore;
    /**
     * 状态
     */
    private String status;

}