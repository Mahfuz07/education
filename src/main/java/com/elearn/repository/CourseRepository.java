package com.elearn.repository;

import com.elearn.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseRepository extends JpaRepository<Course,Integer> {

    Course findByCourseId(Integer courseId);


    @Query(value = "select distinct c from Course c left join fetch c.lessons l left join fetch l.topicses t")
    List<Course> getAllCourseWithLesson();



}
