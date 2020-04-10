package com.elearn.serviceimp;

import com.elearn.model.EventsSubComments;
import com.elearn.repository.EventsSubCommentsRepository;
import com.elearn.service.EventSubCommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventSubCommentsServiceImp implements EventSubCommentsService {

    private EventsSubCommentsRepository eventsSubCommentsRepository;

    @Autowired
    public EventSubCommentsServiceImp(EventsSubCommentsRepository eventsSubCommentsRepository) {
        this.eventsSubCommentsRepository = eventsSubCommentsRepository;
    }

    @Override
    public List<EventsSubComments> getAllData() {

        return eventsSubCommentsRepository.findAll();
    }

    @Override
    public boolean saveData(EventsSubComments obj) {
        eventsSubCommentsRepository.save(obj);
        return true;
    }
}
