package com.elearn.restcontroller;

import com.elearn.model.Teacher;
import com.elearn.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@RestController
@RequestMapping(value = "/teachers")
public class TeacherRestController {


    private TeacherService teacherService;

    @Autowired
    public TeacherRestController(TeacherService teacherService) {
        this.teacherService = teacherService;
    }

    @RequestMapping(value = "/allTeacher", method = RequestMethod.GET)
    public List<Teacher> getAllTeacher(){
        return teacherService.getAllData();
    }

    @RequestMapping(value = "/teacher/{username}", method = RequestMethod.GET)
    public Teacher getTeacherByUsername(@PathVariable("username") String username){
        try {
            return teacherService.getTeacherByUsername(username);
        } catch (Exception ex) {
            Logger.getLogger(TeacherRestController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
