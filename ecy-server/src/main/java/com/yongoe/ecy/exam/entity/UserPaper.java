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
@TableName("e_user_paper")
@Schema(name = "用户-考试")
public class UserPaper {

    @TableId(value="id",type = IdType.AUTO)
    private Long id;

    private Long userId;

    private Long examId;

    private String status;

    private LocalDateTime enterTime;

    private LocalDateTime finishTime;

    private Double score;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @TableField(fill = FieldFill.INSERT)
    private String createBy;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private String updateBy;

}