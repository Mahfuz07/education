package com.elearn.restcontroller;

import com.elearn.model.EventsSubComments;
import com.elearn.service.EventSubCommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@RestController
@RequestMapping(value = "/eventSubComments")
public class EventSubCommentsRestController {

    private EventSubCommentsService eventSubCommentsService;

    @Autowired
    public EventSubCommentsRestController(EventSubCommentsService eventSubCommentsService) {
        this.eventSubCommentsService = eventSubCommentsService;
    }

    @RequestMapping(value = "/saveEventSubComments", method = RequestMethod.POST)
    public EventsSubComments saveComment(@RequestBody EventsSubComments subComments){

        System.out.println("===" + subComments.toString());

        try {
            eventSubCommentsService.saveData(subComments);
        } catch (Exception ex) {
            Logger.getLogger(EventSubCommentsRestController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return subComments;
    }

    @RequestMapping(value = "/allEventSubComments", method = RequestMethod.GET, headers = "Accept=application/json")
    public List<EventsSubComments> getAllSubComments(){
        return eventSubCommentsService.getAllData();
    }

}
