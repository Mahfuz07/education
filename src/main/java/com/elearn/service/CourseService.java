package com.elearn.service;

import com.elearn.model.Course;

import java.util.List;

public interface CourseService {

    public boolean updateCourseStatus(Course course);

    public boolean updteCourse(Course course);

    public boolean saveCourseBookFile(Course course);

    public List<Course> getAllCourseName();

    public List<Course> getAllCourseWithLessonAndTopics();

    public List<Course> getAllData();

    public boolean saveData(Course obj);

    public Course findData(Integer courseId);

    public boolean deleteData(Course obj);

    public boolean updteCourseVideo(Course course);

    public List<Course> getAllCourseInfo();

    public List<Course> getAllCourseWithLesson();

    public List<Course> getCourseWithDetailsByCourseId(Integer id);

}
