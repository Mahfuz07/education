package com.elearn.restcontroller;


import com.elearn.model.Question;
import com.elearn.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/questions")
public class QuestionRestController {

    private QuestionService questionService;

    @Autowired
    public QuestionRestController(QuestionService questionService) {
        this.questionService = questionService;
    }

    @RequestMapping(value = "/questionsByLessonId/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    public List<Question> getAllQuestionsByLessonId(@PathVariable("id") int id) {
        return questionService.getAllQuestionByLessonId(id);
    }

}
