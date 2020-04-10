package com.elearn.controller;

import com.elearn.service.EventService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class LiveClassEventController {


    private EventService eventService;

    @Autowired
    public LiveClassEventController(EventService eventService) {
        this.eventService = eventService;
    }

    @RequestMapping("/live_class")
    public String loadLiveClassPage(Model model) {

        model.addAttribute("page", "live_class_page");
        return "index";
    }

    @RequestMapping("/live_class_event/{id}")
    public String loadLiveClassEventPage(@PathVariable("id") int id, Model model) {
        try {
            User u = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            model.addAttribute("username", u.getUsername());
            model.addAttribute("event", eventService.findData(id));
        } catch (Exception ex) {
            Logger.getLogger(LiveClassEventController.class.getName()).log(Level.SEVERE, null, ex);
        }
        model.addAttribute("page", "live_class_event_page");
        return "index";
    }

}
