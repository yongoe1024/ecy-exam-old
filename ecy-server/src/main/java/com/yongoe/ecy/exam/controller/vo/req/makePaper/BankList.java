package com.yongoe.ecy.exam.controller.vo.req.makePaper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BankList {
    private Long bankId;
    private List<Long> questionIdList;
    private Boolean isAutoSelect;

    private Integer singleChoice;
    private Integer multipleChoice;
    private Integer trueFalse;
    private Integer shortAnswer;

    private Integer singleChoiceScore;
    private Integer multipleChoiceScore;
    private Integer trueFalseScore;
    private Integer shortAnswerScore;
}