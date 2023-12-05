package com.yongoe.ecy.exam.tesk;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.yongoe.ecy.exam.entity.Exam;
import com.yongoe.ecy.exam.entity.UserPaper;
import com.yongoe.ecy.exam.service.ExamService;
import com.yongoe.ecy.exam.service.UserPaperService;
import jakarta.annotation.Resource;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.util.List;

/**
 * 考试结束监控
 *
 * @author yongoe
 * @since 2023/12/5
 */
@Component
@EnableScheduling
public class ExamTime {
    @Resource
    private ExamService examService;
    @Resource
    private UserPaperService userPaperService;

    /**
     * 每五秒钟检测一次是否有考试结束
     */
    @Scheduled(cron = "0/5 * * * * ?")
    public void checkExamTime() {
        List<Exam> exams = examService.list(new LambdaQueryWrapper<Exam>().eq(Exam::getStatus, "3"));
        for (Exam exam : exams) {
            LocalDateTime endTime = exam.getEndTime();
            if (endTime.isBefore(LocalDateTime.now())) {
                exam.setStatus("4");
                examService.updateById(exam);
                for (UserPaper userPaper : userPaperService.list(new LambdaQueryWrapper<UserPaper>().eq(UserPaper::getExamId, exam.getId()))) {
                    //只收已经答题的卷子
                    if (userPaper.getStatus().equals("2")) {
                        userPaperService.handPaperByUserId(exam.getId(), userPaper.getUserId());
                    }
                }
            }
        }
    }

    /**
     * 每五秒钟检测一次是否有考试开始
     */
    @Scheduled(cron = "0/5 * * * * ?")
    public void checkExamStart() {
        List<Exam> exams = examService.list(new LambdaQueryWrapper<Exam>().eq(Exam::getStatus, "2"));
        for (Exam exam : exams) {
            LocalDateTime startTime = exam.getStartTime();
            if (startTime.isBefore(LocalDateTime.now())) {
                exam.setStatus("3");
                examService.updateById(exam);
            }
        }
    }
}
