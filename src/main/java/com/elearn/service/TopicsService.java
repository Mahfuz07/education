package com.elearn.service;

import com.elearn.model.Topics;

import java.util.List;
import java.util.Optional;

public interface TopicsService {

    public List<Topics> getAllWithLesson();

    public Topics getAllWithLessonByTopicsId(int id);

    public boolean updateTopics(Topics topics);

    public boolean updateTopicsStatus(Topics topics);

    public boolean deleteTopicsById(int id);

    public boolean updateTopicsVideoUrl(Topics topics);

    public Boolean saveData(Topics obj);

}
