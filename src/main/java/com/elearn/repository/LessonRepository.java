package com.elearn.repository;

import com.elearn.model.Course;
import com.elearn.model.Lesson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LessonRepository extends JpaRepository<Lesson,Integer> {

    Lesson findByLessonId(int id);

    List<Lesson> findAllByCourse(Course course);

    @Query("select distinct l from Lesson l left join fetch l.course c")
    List<Lesson> getAllLessonWithCourse();

    @Query("select distinct l from Lesson l left join fetch l.course c where l.lessonId = :lessonId")
    Lesson findLessonWithCourseByLessonId(int lessonId);


}
