package com.elearn.service;

import com.elearn.model.LessonExamResult;

import java.util.List;

public interface LessonExamResultService {

    public List<LessonExamResult> getAllLessonExamResultByUsername(String username);

    public boolean saveData(LessonExamResult obj);

}
