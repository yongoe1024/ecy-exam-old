package com.yongoe.ecy.exam.controller.vo.res;

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
@Schema(name = "考试管理Res")
public class ExamRes {

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
    /**
     * 创建时间
     */
    private LocalDateTime createTime;
    /**
     * 修改时间
     */
    private LocalDateTime updateTime;
    /**
     * 创建人
     */
    private String createBy;
    /**
     * 修改人
     */
    private String updateBy;
}