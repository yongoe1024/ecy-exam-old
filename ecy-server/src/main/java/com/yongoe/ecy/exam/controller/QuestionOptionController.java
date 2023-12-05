package com.yongoe.ecy.exam.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.controller.vo.req.QuestionOptionReq;
import com.yongoe.ecy.exam.controller.vo.res.QuestionOptionRes;
import com.yongoe.ecy.exam.convert.QuestionOptionConvert;
import com.yongoe.ecy.exam.entity.QuestionOption;
import com.yongoe.ecy.exam.service.QuestionOptionService;
import com.yongoe.ecy.utils.PageUtils;
import com.yongoe.ecy.utils.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 题目选项
 *
 * @author yongoe
 * @since 2023/11/30
 */
@Tag(name = "题目选项")
@RestController
@RequestMapping("/exam/questionoption")
public class QuestionOptionController {
    @Resource
    private QuestionOptionService questionOptionService;
    @Resource
    private QuestionOptionConvert questionOptionConvert;

    @Operation(summary = "查询分页数据")
    @PostMapping("/page")
    public R page(Long current, Long size, @RequestBody QuestionOptionReq req) {
        QuestionOption entity = questionOptionConvert.req2Entity(req);
        Page<QuestionOption> page = questionOptionService.getQuestionOptionByPage(Page.of(current, size), entity);
        Page<QuestionOptionRes> resPage = questionOptionConvert.entity2ResPage(page);
        return R.success().put(new PageUtils(resPage));
    }

    @Operation(summary = "添加数据")
    @PostMapping("/add")
    public R add(@RequestBody QuestionOptionReq req) {
        QuestionOption questionOption = questionOptionConvert.req2Entity(req);
        questionOptionService.save(questionOption);
        return R.success("添加成功");
    }

    @Operation(summary = "修改数据")
    @PostMapping("/update")
    public R update(@RequestBody QuestionOptionReq req) {
        QuestionOption questionOption = questionOptionConvert.req2Entity(req);
        questionOptionService.updateById(questionOption);
        return R.success("修改成功");
    }

    @Operation(summary = "删除数据")
    @PostMapping("/delete/{ids}")
    public R delete(@PathVariable List<Long> ids) {
        questionOptionService.removeByIds(ids);
        return R.success("删除成功");
    }

}