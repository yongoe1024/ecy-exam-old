package com.yongoe.ecy.exam.controller.vo.res;

import com.yongoe.ecy.exam.entity.Exam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.time.LocalDateTime;

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
@Schema(name = "用户-考试Res")
public class UserPaperRes {

    private Long id;
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

    private ExamRes examRes;

    private String name;

}