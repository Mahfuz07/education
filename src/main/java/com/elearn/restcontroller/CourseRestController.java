package com.elearn.restcontroller;

import com.elearn.model.Course;
import com.elearn.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/courses")
public class CourseRestController {

    private CourseService courseService;

    @Autowired
    public CourseRestController(CourseService courseService) {
        this.courseService = courseService;
    }

    @RequestMapping(value = "/all_courses", method = RequestMethod.GET)
    public List<Course> getCourses(){
        return courseService.getAllData();
    }

    @RequestMapping(value = "/all_courses_with_lesson_and_topics", method = RequestMethod.GET)
    public List<Course> getAllCourseName(){
        return courseService.getAllCourseWithLessonAndTopics();
    }

    @RequestMapping(value = "/course_with_details_by_cid/{id}", method = RequestMethod.GET)
    public List<Course> getCourseWithDetailsByCourseId(@PathVariable("id") int id){
        return courseService.getCourseWithDetailsByCourseId(id);
    }

    @RequestMapping(value = "/all_courses_with_lesson", method = RequestMethod.GET)
    public List<Course> getAllCourseWithLesson(){
        return courseService.getAllCourseWithLesson();
    }

}
