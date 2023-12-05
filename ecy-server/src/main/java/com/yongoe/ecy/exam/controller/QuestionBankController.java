package com.yongoe.ecy.exam.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.controller.vo.req.QuestionBankReq;
import com.yongoe.ecy.exam.controller.vo.res.QuestionBankRes;
import com.yongoe.ecy.exam.convert.QuestionBankConvert;
import com.yongoe.ecy.exam.entity.Question;
import com.yongoe.ecy.exam.entity.QuestionBank;
import com.yongoe.ecy.exam.service.QuestionBankService;
import com.yongoe.ecy.exam.service.QuestionService;
import com.yongoe.ecy.utils.PageUtils;
import com.yongoe.ecy.utils.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 题库管理
 *
 * @author yongoe
 * @since 2023/11/30
 */
@Tag(name = "题库管理")
@RestController
@RequestMapping("/exam/questionbank")
public class QuestionBankController {
    @Resource
    private QuestionBankService questionBankService;
    @Resource
    private QuestionBankConvert questionBankConvert;
    @Resource
    private QuestionService questionService;

    @Operation(summary = "查询题库列表")
    @PostMapping("/banklist")
    public R banklist(Long bankId) {
        List<QuestionBank> list = questionBankService.list(new LambdaQueryWrapper<QuestionBank>() .eq(bankId != null, QuestionBank::getId, bankId));
        List<QuestionBankRes> questionBankRes = questionBankConvert.entity2ResList(list);
        List<QuestionBankRes> process = process(questionBankRes);
        return R.success().put(process);
    }

    @Operation(summary = "查询分页数据")
    @PostMapping("/page")
    public R page(Long current, Long size, @RequestBody QuestionBankReq req) {
        QuestionBank entity = questionBankConvert.req2Entity(req);
        Page<QuestionBank> page = questionBankService.getQuestionBankByPage(Page.of(current, size), entity);
        Page<QuestionBankRes> resPage = questionBankConvert.entity2ResPage(page);
        Page<QuestionBankRes> process = process(resPage);
        return R.success().put(new PageUtils(process));
    }

    @Operation(summary = "添加数据")
    @PostMapping("/add")
    public R add(@RequestBody QuestionBankReq req) {
        QuestionBank questionBank = questionBankConvert.req2Entity(req);
        questionBankService.save(questionBank);
        return R.success("添加成功");
    }

    @Operation(summary = "修改数据")
    @PostMapping("/update")
    public R update(@RequestBody QuestionBankReq req) {
        QuestionBank questionBank = questionBankConvert.req2Entity(req);
        questionBankService.updateById(questionBank);
        return R.success("修改成功");
    }

    @Operation(summary = "删除数据")
    @PostMapping("/delete/{ids}")
    public R delete(@PathVariable List<Long> ids) {
        for (Long id : ids) {
            int count = (int) questionService.count(new LambdaQueryWrapper<Question>().eq(Question::getQuestionBankId, id));
            if (count > 0) {
                return R.error("题库下存在试题，无法删除");
            }
        }
        questionBankService.removeByIds(ids);
        return R.success("删除成功");
    }

    /**
     * 处理题库数量
     */
    private Page<QuestionBankRes> process(Page<QuestionBankRes> page) {
        for (QuestionBankRes record : page.getRecords()) {
            int count = (int) questionService.count(new LambdaQueryWrapper<Question>().eq(Question::getQuestionBankId, record.getId()));
            record.setNum(count);
        }
        return page;
    }


    private List<QuestionBankRes> process(List<QuestionBankRes> list) {
        for (QuestionBankRes record : list) {
            int count = (int) questionService.count(new LambdaQueryWrapper<Question>().eq(Question::getQuestionBankId, record.getId()));
            record.setNum(count);
            int singleChoice = (int) questionService.count(new LambdaQueryWrapper<Question>()
                    .eq(Question::getQuestionBankId, record.getId())
                    .eq(Question::getType, "单选"));
            record.setSingleChoice(singleChoice);
            int multipleChoice = (int) questionService.count(new LambdaQueryWrapper<Question>()
                    .eq(Question::getQuestionBankId, record.getId())
                    .eq(Question::getType, "多选"));
            record.setMultipleChoice(multipleChoice);
            int trueFalse = (int) questionService.count(new LambdaQueryWrapper<Question>()
                    .eq(Question::getQuestionBankId, record.getId())
                    .eq(Question::getType, "判断"));
            record.setTrueFalse(trueFalse);
            int shortAnswer = (int) questionService.count(new LambdaQueryWrapper<Question>()
                    .eq(Question::getQuestionBankId, record.getId())
                    .eq(Question::getType, "简答"));
            record.setShortAnswer(shortAnswer);
        }
        return list;
    }

}