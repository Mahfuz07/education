package com.elearn.repository;


import com.elearn.model.LessonExamResult;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LessonExamResultRepository extends JpaRepository<LessonExamResult,Integer> {

    List<LessonExamResult> findAllByUsername(String username);

}
