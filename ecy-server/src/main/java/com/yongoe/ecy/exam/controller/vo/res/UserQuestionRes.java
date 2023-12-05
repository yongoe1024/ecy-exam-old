package com.yongoe.ecy.exam.controller.vo.res;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;

import java.time.LocalDateTime;

/**
 * 用户-题目
 *
 * @author yongoe
 * @since 2023/12/04
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "用户-题目Res")
public class UserQuestionRes {

    /**
     * 
     */
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
     * 问题id
     */
    private Long questionId;
    /**
     * 答案
     */
    private String answer;
    /**
     * 得分
     */
    private Double score;
    /**
     * 是否正确
     */
    private Boolean isTrue;
}