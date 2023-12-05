package com.yongoe.ecy.exam.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.yongoe.ecy.exam.controller.vo.req.QuestionReq;
import com.yongoe.ecy.exam.controller.vo.res.QuestionRes;
import com.yongoe.ecy.exam.convert.QuestionConvert;
import com.yongoe.ecy.exam.entity.ExamQuestion;
import com.yongoe.ecy.exam.entity.Question;
import com.yongoe.ecy.exam.entity.QuestionOption;
import com.yongoe.ecy.exam.service.ExamQuestionService;
import com.yongoe.ecy.exam.service.QuestionOptionService;
import com.yongoe.ecy.exam.service.QuestionService;
import com.yongoe.ecy.utils.PageUtils;
import com.yongoe.ecy.utils.R;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 题目管理
 *
 * @author yongoe
 * @since 2023/11/30
 */
@Tag(name = "题目管理")
@RestController
@RequestMapping("/exam/question")
public class QuestionController {
    @Resource
    private QuestionService questionService;
    @Resource
    private QuestionOptionService questionOptionService;
    @Resource
    private ExamQuestionService examQuestionService;
    @Resource
    private QuestionConvert questionConvert;


    @Operation(summary = "查询分页数据")
    @PostMapping("/page")
    public R page(Long current, Long size, @RequestBody QuestionReq req) {
        Question entity = questionConvert.req2Entity(req);
        Page<Question> page = questionService.getQuestionByPage(Page.of(current, size), entity);
        Page<QuestionRes> resPage = questionConvert.entity2ResPage(page);
        return R.success().put(new PageUtils(resPage));
    }

    @Operation(summary = "添加数据")
    @PostMapping("/add")
    public R add(@RequestBody QuestionReq req) {
        Question question = questionConvert.req2Entity(req);
        questionService.save(question);
        return R.success("添加成功");
    }

    @Operation(summary = "修改数据")
    @PostMapping("/update")
    public R update(@RequestBody QuestionReq req) {
        Question question = questionConvert.req2Entity(req);
        questionService.updateById(question);
        return R.success("修改成功");
    }

    @Operation(summary = "删除数据")
    @PostMapping("/delete/{ids}")
    public R delete(@PathVariable List<Long> ids) {
        List<ExamQuestion> examQuestionList = examQuestionService.list(new LambdaQueryWrapper<ExamQuestion>().in(ExamQuestion::getQuestionId, ids));
        if (examQuestionList.size() > 0) {
            return R.error("题目已在考试中，无法删除");
        }
        questionService.removeByIds(ids);
        questionOptionService.remove(new LambdaQueryWrapper<QuestionOption>().in(QuestionOption::getQuestionId, ids));
        return R.success("删除成功");
    }

}