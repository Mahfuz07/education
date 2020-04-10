package com.elearn.restcontroller;

import com.elearn.model.Student;
import com.elearn.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@RestController
@RequestMapping(value = "/students")
public class StudentRestController {


    private StudentService studentService;

    @Autowired
    public StudentRestController(StudentService studentService) {
        this.studentService = studentService;
    }

    @RequestMapping(value = "/allStudent", method = RequestMethod.GET)
    public List<Student> getAllStudent(){
        return studentService.getAllData();
    }

    @RequestMapping(value = "/student/{username}", method = RequestMethod.GET)
    public Student getStudentByUsername(@PathVariable("username") String username){
        try {
            return studentService.getStudentByUserName(username);
        } catch (Exception ex) {
            Logger.getLogger(StudentRestController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
