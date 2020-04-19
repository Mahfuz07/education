package com.elearn.repository;

import com.elearn.model.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface QuestionRepository extends JpaRepository<Question,Integer> {

    List<Question> findAllByLessonIdAndStatus(int id,Boolean status);

    Question findByQuestionId(Integer questionId);
}