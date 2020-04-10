package com.elearn.service;

import com.elearn.model.Comments;
import com.elearn.model.EventsComments;
import org.slf4j.event.EventConstants;

import java.util.List;

public interface EventCommentsService {

    public List<EventsComments> getAllCommentsByEventId(int id);

    public boolean saveData(EventsComments obj);

}
