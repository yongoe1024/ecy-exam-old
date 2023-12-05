package com.yongoe.ecy.exam.controller.vo.excel;

import cn.afterturn.easypoi.excel.annotation.Excel;
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
@Schema(name = "用户-考试Excel")
public class UserPaperExcel {


    @Excel(name = "考试名称", width = 20)
    private String examName;

    @Excel(name = "部门", width = 20)
    private String deptName;

    @Excel(name = "用户", width = 20)
    private String name;

    @Excel(name = "考试状态", width = 20, replace = {"未参加_1", "考试中_2", "未通过_3", "通过_4","已交卷_5"})
    private String status;

    @Excel(name = "开始时间", width = 20)
    private LocalDateTime enterTime;

    @Excel(name = "交卷时间", width = 20)
    private LocalDateTime finishTime;

    @Excel(name = "得分", width = 20)
    private Double score;

}