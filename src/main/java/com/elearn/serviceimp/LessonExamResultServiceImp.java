package com.elearn.serviceimp;

import com.elearn.model.LessonExamResult;
import com.elearn.repository.LessonExamResultRepository;
import com.elearn.service.LessonExamResultService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LessonExamResultServiceImp implements LessonExamResultService {

    private LessonExamResultRepository lessonExamResultRepository;

    @Autowired
    public LessonExamResultServiceImp(LessonExamResultRepository lessonExamResultRepository) {
        this.lessonExamResultRepository = lessonExamResultRepository;
    }


    @Override
    public List<LessonExamResult> getAllLessonExamResultByUsername(String username) {
        return lessonExamResultRepository.findAllByUsername(username);
    }

    @Override
    public boolean saveData(LessonExamResult obj) {

        lessonExamResultRepository.save(obj);

        return true;
    }
}
