package com.elearn.serviceimp;

import com.elearn.model.Comments;
import com.elearn.model.EventsComments;
import com.elearn.repository.EventCommentsRepository;
import com.elearn.service.EventCommentsService;
import org.slf4j.event.EventConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class EventCommentsServiceImp implements EventCommentsService {

    private EventCommentsRepository eventCommentsRepository;

    @Autowired
    public EventCommentsServiceImp(EventCommentsRepository eventCommentsRepository) {
        this.eventCommentsRepository = eventCommentsRepository;
    }


    @Override
    public List<EventsComments> getAllCommentsByEventId(int id) {

        List<EventsComments> eventsComments = eventCommentsRepository.findAllByEventId(id);

        List<EventsComments> eventsComments1 = new ArrayList<>();

        for(EventsComments  eventsComments2:eventsComments){
            EventsComments comments3 = new EventsComments();
            comments3.setEventsCommentsId(eventsComments2.getEventsCommentsId());
            comments3.setUsername(eventsComments2.getUsername());
            comments3.setComment(eventsComments2.getComment());
            eventsComments1.add(comments3);
        }

        return eventsComments1;
    }

    @Override
    public boolean saveData(EventsComments obj) {

        eventCommentsRepository.save(obj);

        return true;
    }
}
