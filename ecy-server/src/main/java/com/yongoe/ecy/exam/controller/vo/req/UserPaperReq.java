package com.yongoe.ecy.exam.controller.vo.req;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 用户-考试
 *
 * @author yongoe
 * @since 2023/12/04
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "用户-考试Req")
public class UserPaperReq {
    private Long id;
    /**
     * 我的考试页面
     */
    private String examName;

    /**
     * 用户id
     */
    private Long userId;
    /**
     * 考试id
     */
    private Long examId;
    /**
     * 考试状态
     */
    private String status;
    /**
     * 开始时间
     */
    private LocalDateTime enterTime;
    /**
     * 交卷时间
     */
    private LocalDateTime finishTime;
    /**
     * 得分
     */
    private Double score;
}