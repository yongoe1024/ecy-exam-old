package com.yongoe.ecy.exam.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.controller.vo.req.ExamReq;
import com.yongoe.ecy.exam.controller.vo.req.makePaper.MakePaperReq;
import com.yongoe.ecy.exam.controller.vo.res.ExamRes;
import com.yongoe.ecy.exam.convert.ExamConvert;
import com.yongoe.ecy.exam.entity.Exam;
import com.yongoe.ecy.exam.service.ExamService;
import com.yongoe.ecy.utils.PageUtils;
import com.yongoe.ecy.utils.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * 考试管理
 *
 * @author yongoe
 * @since 2023/11/30
 */
@Tag(name = "考试管理")
@RestController
@RequestMapping("/exam/exam")
public class ExamController {
    @Resource
    private ExamService examService;
    @Resource
    private ExamConvert examConvert;

    @Operation(summary = "提前结束考试")
    @PostMapping("/finish/{examId}")
    public R finish(@PathVariable Long examId) {
        Exam exam = examService.getById(examId);
        if(exam.getStatus().equals("4")){
            return R.error("考试已经结束");
        }
        exam.setStatus("4");
        examService.updateById(exam);
        return R.success("正在结束考试");
    }

    @Operation(summary = "管理员考试详情")
    @PostMapping("/info/{examId}")
    public R info(@PathVariable Long examId) {
        Map<String, Object> map = examService.getExamInfo(examId);
        return R.success().put(map);
    }

    @Operation(summary = "组卷")
    @PostMapping("/makepaper/{examId}")
    public R makepaper(@PathVariable Long examId, @RequestBody MakePaperReq makePaper) {
        Exam exam = examService.getById(examId);
        String status = exam.getStatus();
        if (!"1".equals(status)) {
            return R.error("已发放试卷，无法修改");
        }
        examService.makepaper(examId, makePaper);
        return R.success("组卷成功，正在发放试题至考生");
    }

    @Operation(summary = "查询分页数据")
    @PostMapping("/page")
    public R page(Long current, Long size, @RequestBody ExamReq req) {
        Exam entity = examConvert.req2Entity(req);
        Page<Exam> page = examService.getExamByPage(Page.of(current, size), entity);
        Page<ExamRes> resPage = examConvert.entity2ResPage(page);
        return R.success().put(new PageUtils(resPage));
    }

    @Operation(summary = "添加数据")
    @PostMapping("/add")
    public R add(@RequestBody ExamReq req) {
        Exam exam = examConvert.req2Entity(req);
        exam.setStatus("1");
        LocalDateTime startTime = exam.getStartTime();
        LocalDateTime endTime = exam.getEndTime();
        if (endTime.isBefore(LocalDateTime.now())) {
            return R.error("结束不能小于当前时间");
        }
        if (startTime.isAfter(endTime)) {
            return R.error("开始时间不能大于结束时间");
        }
        examService.save(exam);
        return R.success("添加成功");
    }

    @Operation(summary = "删除数据")
    @PostMapping("/delete/{ids}")
    public R delete(@PathVariable List<Long> ids) {
        for (Long id : ids) {
            examService.removeAllInfo(id);
        }
        return R.success("删除成功");
    }

}