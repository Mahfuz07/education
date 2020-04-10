package com.elearn.service;

import com.elearn.model.Question;

import java.util.List;

public interface QuestionService {

    public List<Question> getAllQuestionByLessonId(int id);

    public boolean saveData(Question obj);

    public List<Question> getAllData();

    public Question findData(Integer questionId);

    public boolean updateData(Question obj);

    public boolean deleteData(Question obj);
}
