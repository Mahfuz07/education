package com.elearn.serviceimp;

import com.elearn.model.Question;
import com.elearn.repository.QuestionRepository;
import com.elearn.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QuestionServiceImp implements QuestionService {

    private QuestionRepository questionRepository;

    @Autowired
    public QuestionServiceImp(QuestionRepository questionRepository) {
        this.questionRepository = questionRepository;
    }


    @Override
    public List<Question> getAllQuestionByLessonId(int id) {
        return questionRepository.findAllByLessonIdAndStatus(id,true);
    }

    @Override
    public boolean saveData(Question obj) {
        questionRepository.save(obj);

        return true;
    }

    @Override
    public List<Question> getAllData() {
        return questionRepository.findAll();
    }

    @Override
    public Question findData(Integer questionId) {


        return questionRepository.findByQuestionId(questionId);
    }

    @Override
    public boolean updateData(Question obj) {
        questionRepository.save(obj);

        return true;
    }

    @Override
    public boolean deleteData(Question obj) {

        questionRepository.deleteById(obj.getQuestionId());
        return true;
    }


}
