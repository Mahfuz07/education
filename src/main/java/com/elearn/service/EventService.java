package com.elearn.service;

import com.elearn.model.Event;

import java.util.List;

public interface EventService {

    public boolean saveEventNotesFile(Event event);

    public boolean saveEventPPTFile(Event event);

    public boolean updateEventVideo(Event event);

    public boolean updateEventStatus(Event event);

    public Event findData(Integer eventId);

    public List<Event> getAllData();

    public boolean saveData(Event obj);

    public boolean updateData(Event obj);

    public boolean deleteData(Event obj);

}
