package com.elearn.restcontroller;


import com.elearn.model.Course;
import com.elearn.model.Lesson;
import com.elearn.service.CourseService;
import com.elearn.service.LessonService;
import com.elearn.service.TopicsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@RestController
@RequestMapping(value = "/topics")
public class TopicsRestController {

    private CourseService courseService;

    private LessonService lessonService;

    private TopicsService topicsService;

    @Autowired
    public TopicsRestController(CourseService courseService, LessonService lessonService, TopicsService topicsService) {
        this.courseService = courseService;
        this.lessonService = lessonService;
        this.topicsService = topicsService;
    }

    @RequestMapping(value = "/allCoursesInfo", method = RequestMethod.GET, headers = "Accept=application/json")
    public List<Course> getAllCoursesName(){
        return courseService.getAllCourseInfo();
    }


    @RequestMapping(value = "/allCourses", method = RequestMethod.GET, headers = "Accept=application/json")
    public List<Course> getAllCourse(){
//        return courseDao.getAllData(Course.class);
//        return courseDao.getAllCourse();
        return courseService.getAllCourseWithLessonAndTopics();
    }

    @RequestMapping(value = "/allCourseName", method = RequestMethod.GET, headers = "Accept=application/json")
    public List<Course> getAllCourseName(){
        return courseService.getAllCourseName();
    }

    @RequestMapping(value = "/allLessons", method = RequestMethod.GET, headers = "Accept=application/json")
    public List<Lesson> getAllLesson(){
        return lessonService.getAllData();
    }

    @RequestMapping(value = "/lessonByCourseId/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    public List<Lesson> getLessonByCourseId(@PathVariable("id") int id){
        try {
            return lessonService.getLessonByCourseIdByJDBC(id);
        } catch (Exception ex) {
            Logger.getLogger(TopicsRestController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
