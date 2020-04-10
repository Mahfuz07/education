package com.elearn.restcontroller;

import com.elearn.model.Subcomments;
import com.elearn.service.SubCommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@RestController
@RequestMapping(value = "/subComments")
public class SubCommentsRestController {


    private SubCommentsService subCommentsService;

    @Autowired
    public SubCommentsRestController(SubCommentsService subCommentsService) {
        this.subCommentsService = subCommentsService;
    }

    @RequestMapping(value = "/saveSubComments", method = RequestMethod.POST)
    public Subcomments saveComment(@RequestBody Subcomments subComments){

        System.out.println("===" + subComments.toString());

        try {
            subCommentsService.saveData(subComments);
        } catch (Exception ex) {
            Logger.getLogger(SubCommentsRestController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return subComments;
    }

    @RequestMapping(value = "/allSubComments", method = RequestMethod.GET, headers = "Accept=application/json")
    public List<Subcomments> getAllSubComments(){
        return subCommentsService.getAllData();
    }

}
