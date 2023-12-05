package com.yongoe.ecy.exam.controller.vo.req.makePaper;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 组卷信息
 *
 * @author yongoe
 * @since 2023/12/2
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Schema(name = "组卷信息Req")
public class MakePaperReq {

    private BankForm bankForm;
    private ConfigForm configForm;
    private AuthForm authForm;

}
