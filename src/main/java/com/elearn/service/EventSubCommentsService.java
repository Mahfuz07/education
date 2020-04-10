package com.elearn.service;

import com.elearn.model.EventsSubComments;
import com.elearn.model.Subcomments;

import java.util.List;

public interface EventSubCommentsService {

    public List<EventsSubComments> getAllData();

    public boolean saveData(EventsSubComments obj);

}
