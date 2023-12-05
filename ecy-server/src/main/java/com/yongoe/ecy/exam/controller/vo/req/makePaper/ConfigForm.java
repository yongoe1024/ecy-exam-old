package com.yongoe.ecy.exam.controller.vo.req.makePaper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ConfigForm {
    private Integer totalScore;
    private Integer passScore;
}
