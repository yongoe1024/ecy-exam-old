package com.yongoe.ecy.exam.entity;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 题目选项
 *
 * @author yongoe
 * @since 2023/11/30
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("e_question_option")
@Schema(name = "题目选项")
public class QuestionOption {

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    private Long questionId;

    private String content;

    private Boolean isTrue;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @TableField(fill = FieldFill.INSERT)
    private String createBy;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateBy;

}