package com.yongoe.ecy.exam.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
@TableName("e_user_question")
@Schema(name = "用户-题目")
public class UserQuestion {

    @TableId(value="id",type = IdType.AUTO)
    private Long id;

    private Long userId;

    private Long examId;

    private Long questionId;

    private String answer;

    private Double score;

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