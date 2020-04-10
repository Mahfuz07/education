package com.elearn.admincontroller;

import com.elearn.model.Teacher;
import com.elearn.model.Users;
import com.elearn.service.TeacherService;
import com.elearn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
@RequestMapping("/admin")
public class TeacherController {



    private TeacherService teacherService;

    private UserService userService;

    @Autowired
    public TeacherController(TeacherService teacherService, UserService userService) {
        this.teacherService = teacherService;
        this.userService = userService;
    }

    @RequestMapping(value = "/list_teacher", method = RequestMethod.GET)
    public String loadMangeStudent(Model model, Teacher teacher, HttpServletRequest request){
        model.addAttribute("users", userService.getAllTeacherUsers());
        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));
        return "/admin/list_teacher";
    }

    @RequestMapping(value = "/update_teacher_status/{id}/{status}", method = RequestMethod.GET)
    public String updateStudentStatus(Model model, @PathVariable("id") int id, @PathVariable("status") boolean status){

        try {
            Users u = userService.findData(id);
            u.setEnabled(!status);
            userService.updateData(u);
            model.addAttribute("sm", "Status update successfull");
        } catch (Exception ex) {
            model.addAttribute("em", "Status not update");
            Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/admin/list_teacher";
    }

    @RequestMapping(value = "/delete_teacher/{id}", method = RequestMethod.GET)
    public String deleteStudent(Model model, @PathVariable("id") int id){

        try {
            Users u = userService.findData(id);
            teacherService.deleteTeacherByUsername(u.getUsername());
            userService.deleteData(u);
            model.addAttribute("sm", "Teacher delete successfully");
        } catch (Exception ex) {
            model.addAttribute("em", "not delete");
            Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/admin/list_teacher";
    }

}
