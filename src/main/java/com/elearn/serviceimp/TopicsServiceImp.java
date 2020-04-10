package com.elearn.serviceimp;

import com.elearn.model.Topics;
import com.elearn.repository.TopicsRepository;
import com.elearn.service.TopicsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TopicsServiceImp implements TopicsService {

    private TopicsRepository topicsRepository;

    @Autowired
    public TopicsServiceImp(TopicsRepository topicsRepository) {
        this.topicsRepository = topicsRepository;
    }


    @Override
    public List<Topics> getAllWithLesson() {
        return topicsRepository.getAllWithLesson();
    }

    @Override
    public Topics getAllWithLessonByTopicsId(int id) {
        return topicsRepository.getAllWithLessonByTopicsId(id);

    }

    @Override
    public boolean updateTopics(Topics obj) {
        Topics topics = topicsRepository.findByTopicsId(obj.getTopicsId());

        topics.setTopicsTitle(obj.getTopicsTitle());
        topics.setDescription(obj.getDescription());
        topics.setDuration(obj.getDuration());
        topicsRepository.save(topics);
        return true;
    }

    @Override
    public boolean updateTopicsStatus(Topics obj) {
        Topics topics = topicsRepository.findByTopicsId(obj.getTopicsId());
        topics.setStatus(obj.getStatus());
        topicsRepository.save(topics);
        return true;
    }

    @Override
    public boolean deleteTopicsById(int id) {

        topicsRepository.deleteById(id);

        return true;
    }

    public boolean updateTopicsVideoUrl(Topics obj){

        Topics topics = topicsRepository.findByTopicsId(obj.getTopicsId());
        topics.setVideoUrl(obj.getVideoUrl());
        topicsRepository.save(topics);
        return true;
    }

    @Override
    public Boolean saveData(Topics obj) {
        topicsRepository.save(obj);
        return true;
    }


}
