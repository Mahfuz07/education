package com.elearn.restcontroller;

import com.elearn.model.Lesson;
import com.elearn.service.LessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/lessons")
public class LessonRestController {

    private LessonService lessonService;

    @Autowired
    public LessonRestController(LessonService lessonService) {
        this.lessonService = lessonService;
    }

    @RequestMapping(value = "/all_lessons", method = RequestMethod.GET)
    public List<Lesson> allLessons(){
        return lessonService.getAllData();
    }

}
