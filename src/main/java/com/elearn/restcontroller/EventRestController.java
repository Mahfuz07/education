package com.elearn.restcontroller;

import com.elearn.model.Event;
import com.elearn.service.EventService;
import com.elearn.serviceimp.EventServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@RestController
@RequestMapping(value = "/events")
public class EventRestController {

    private EventService eventService;

    @Autowired
    public EventRestController(EventServiceImp eventService) {
        this.eventService = eventService;
    }

    @RequestMapping(value = "/allEvents", method = RequestMethod.GET, headers = "Accept=application/json")
    public List<Event> getAllEvent(){
        return eventService.getAllData();
    }

    @RequestMapping(value = "/event/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    public Event getSelectedEventByEventId(@PathVariable("id") int id){
        try {
            return eventService.findData(id);
        } catch (Exception ex) {
            Logger.getLogger(EventRestController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
