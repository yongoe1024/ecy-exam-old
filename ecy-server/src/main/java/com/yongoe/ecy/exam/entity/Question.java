package com.yongoe.ecy.exam.entity;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * 题目管理
 *
 * @author yongoe
 * @since 2023/11/30
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("e_question")
@Schema(name = "题目管理")
public class Question {

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @TableField(exist = false)
    private String questionBankName;

    private Long questionBankId;

    private String content;

    private String type;

    private String level;

    private String answer;

    @TableField(exist = false)
    private Integer score;

    @TableField(exist = false)
    private String myAnswer;

    @TableField(exist = false)
    private String myScore;

    @TableField(exist = false)
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