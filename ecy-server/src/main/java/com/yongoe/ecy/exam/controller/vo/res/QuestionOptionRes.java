package com.yongoe.ecy.exam.controller.vo.res;

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
@Schema(name = "题目选项Res")
public class QuestionOptionRes {

    /**
     *
     */
    private Long id;
    /**
     * 题目id
     */
    private Long questionId;
    /**
     * 内容
     */
    private String content;
    /**
     * 是否正确
     */
    private Boolean isTrue;
}