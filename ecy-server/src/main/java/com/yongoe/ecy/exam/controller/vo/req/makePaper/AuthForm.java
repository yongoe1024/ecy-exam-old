package com.yongoe.ecy.exam.controller.vo.req.makePaper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuthForm {
    private String openType;
    private List<Long> departmenIdtList;
    private List<Long> userIdList;
}