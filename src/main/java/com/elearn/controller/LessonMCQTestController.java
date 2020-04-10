package com.elearn.controller;

import com.elearn.model.Lesson;
import com.elearn.model.LessonExamResult;
import com.elearn.service.LessonExamResultService;
import com.elearn.service.LessonService;
import com.elearn.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;

@Controller
public class LessonMCQTestController {



    private QuestionService questionService;

    private LessonExamResultService lessonExamResultService;

    private LessonService lessonService;

    @Autowired
    public LessonMCQTestController(QuestionService questionService, LessonExamResultService lessonExamResultService, LessonService lessonService) {
        this.questionService = questionService;
        this.lessonExamResultService = lessonExamResultService;
        this.lessonService = lessonService;
    }

    @RequestMapping(value = "/lessonMcqTest/{id}", method = RequestMethod.GET)
    public String loadLessonMcqTest(Model model, @PathVariable("id") int id){

        model.addAttribute("lessonId", id);
//        model.addAttribute("questions", questionDao.getAllQuestionByLessonId(id));
        model.addAttribute("page", "lessonMcqTest_page");
        return "/index";
    }


    @RequestMapping(value = "/saveLessonExamResult", method = RequestMethod.POST)
    public String saveLessonExamResult(LessonExamResult lessonExamResult, Model model){

        try {
            User u = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            Lesson l = lessonService.getLessonByLessonId(lessonExamResult.getLessonId());
            lessonExamResult.setUsername(u.getUsername());
            lessonExamResult.setLessonName(l.getLessonTitle());
            lessonExamResult.setExamDate(new Date());

            lessonExamResultService.saveData(lessonExamResult);
            model.addAttribute("username", u.getUsername());
        } catch (Exception e) {
            e.printStackTrace();
        }


        System.out.println("====" + lessonExamResult.toString());


        model.addAttribute("page", "submitResultSuccess_page");
        return "/index";
    }


    @RequestMapping(value = "/lessonExamResultChart", method = RequestMethod.GET)
    public String lessonExamResultChart(Model model){
        try {
            User u = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            model.addAttribute("results", lessonExamResultService.getAllLessonExamResultByUsername(u.getUsername()));
            model.addAttribute("username", u.getUsername());
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("page", "lesson_result_page");
        return "/index";
    }

}
