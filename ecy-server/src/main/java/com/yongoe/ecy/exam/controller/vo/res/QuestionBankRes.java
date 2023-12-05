package com.yongoe.ecy.exam.controller.vo.res;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 题库管理
 *
 * @author yongoe
 * @since 2023/11/30
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "题库管理Res")
public class QuestionBankRes {

    /**
     *
     */
    private Long id;
    /**
     * 名称
     */
    private String name;

    /**
     * 备注
     */
    private String remark;

    /*    其他    */

    /**
     * 试题数量
     */
    private Integer num;

    /**
     * 单选数量
     */
    private Integer singleChoice;
    /**
     * 多选数量
     */
    private Integer multipleChoice;
    /**
     * 判断数量
     */
    private Integer trueFalse;
    /**
     * 简答数量
     */
    private Integer shortAnswer;
}