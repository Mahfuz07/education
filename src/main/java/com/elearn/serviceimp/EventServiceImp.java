package com.elearn.serviceimp;

import com.elearn.model.Event;
import com.elearn.repository.EventRepository;
import com.elearn.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EventServiceImp implements EventService {


    private EventRepository eventRepository;

    @Autowired
    public EventServiceImp(EventRepository eventRepository) {
        this.eventRepository = eventRepository;
    }


    @Override
    public boolean saveEventNotesFile(Event obj) {

        Event event = eventRepository.findByEventId(obj.getEventId());

        event.setNotesFile(obj.getNotesFile());
        eventRepository.save(event);
        return true;
    }

    @Override
    public boolean saveEventPPTFile(Event obj) {

        Event event = eventRepository.findByEventId(obj.getEventId());
        event.setPresentationFile(obj.getPresentationFile());
        eventRepository.save(event);
        return true;
    }

    @Override
    public boolean updateEventVideo(Event obj) {

        Event event = eventRepository.findByEventId(obj.getEventId());

        event.setVideoUrl(obj.getVideoUrl());
        eventRepository.save(event);
        return true;
    }

    @Override
    public boolean updateEventStatus(Event obj) {

        Event event = eventRepository.findByEventId(obj.getEventId());

        event.setStatus(obj.isStatus());
        eventRepository.save(event);
        return true;
    }

    @Override
    public Event findData(Integer eventId) {
        return eventRepository.findByEventId(eventId);
    }

    @Override
    public List<Event> getAllData() {
        return eventRepository.findAll();
    }

    @Override
    public boolean saveData(Event obj) {

        eventRepository.save(obj);
        return true;
    }

    @Override
    public boolean updateData(Event obj) {
        eventRepository.save(obj);

        return true;
    }

    @Override
    public boolean deleteData(Event obj) {
        eventRepository.deleteById(obj.getEventId());

        return true;
    }


}
