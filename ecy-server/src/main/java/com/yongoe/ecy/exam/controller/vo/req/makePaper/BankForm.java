package com.yongoe.ecy.exam.controller.vo.req.makePaper;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BankForm {
    private List<BankList> bankList;
}

