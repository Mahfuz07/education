package com.elearn.restcontroller;

import com.elearn.model.EventsComments;
import com.elearn.service.EventCommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@RestController
@RequestMapping(value = "/eventComments")
public class EventCommentsRestController {

    private EventCommentsService eventCommentsService;

    @Autowired
    public EventCommentsRestController(EventCommentsService eventCommentsService) {
        this.eventCommentsService = eventCommentsService;
    }

    @RequestMapping(value = "/saveEventComments", method = RequestMethod.POST)
    public EventsComments saveComment(@RequestBody EventsComments comments){

        System.out.println("===" + comments.toString());

        
            try {

                eventCommentsService.saveData(comments);
            } catch (Exception ex) {
                Logger.getLogger(EventCommentsRestController.class.getName()).log(Level.SEVERE, null, ex);
            }
        

        return comments;
    }

    @RequestMapping(value = "/allEventCommentsByEventId/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    public List<EventsComments> getAllComments(@PathVariable("id") int id){
        return eventCommentsService.getAllCommentsByEventId(id);
    }



}
