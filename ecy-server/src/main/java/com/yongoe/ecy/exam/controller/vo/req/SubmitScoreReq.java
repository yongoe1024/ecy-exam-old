package com.yongoe.ecy.exam.controller.vo.req;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 批阅分数
 *
 * @author yongoe
 * @since 2023/12/5
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "批阅分数")
public class SubmitScoreReq {

    /**
     * 题目id
     */
    private Long id;

    private String score;

    private String myScore;

}
