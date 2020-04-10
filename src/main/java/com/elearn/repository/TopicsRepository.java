package com.elearn.repository;

import com.elearn.model.Lesson;
import com.elearn.model.Topics;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface TopicsRepository extends JpaRepository<Topics, Integer> {

    @Query("select distinct t from Topics t left join fetch t.lesson l left join fetch l.course c")
    List<Topics> getAllWithLesson();

    @Query("select distinct t from Topics t left join fetch t.lesson l left join fetch l.course c where t.topicsId = :topicsId")
    Topics getAllWithLessonByTopicsId(Integer topicsId);

    Topics findByTopicsId(Integer id);

    List<Topics> findAllByLesson(Lesson lesson);

}
