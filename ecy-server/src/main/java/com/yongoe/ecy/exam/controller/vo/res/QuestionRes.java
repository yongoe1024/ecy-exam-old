package com.yongoe.ecy.exam.controller.vo.res;

import com.baomidou.mybatisplus.annotation.TableField;
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
@Schema(name = "题目管理Res")
public class QuestionRes {

    /**
     *
     */
    private Long id;
    /**
     * 题库名称
     */
    private String questionBankName;
    /**
     * 题库id
     */
    private Long questionBankId;
    /**
     * 题目
     */
    private String content;
    /**
     * 类型
     */
    private String type;
    /**
     * 题目难度
     */
    private String level;
    /**
     * 正确答案
     */
    private String answer;
    /* 额外 */
    /**
     * 分数
     */
    private Integer score;

    /**
     * 我的答案
     */
    private String myAnswer;

    private String myScore;

    private String isTrue;
}