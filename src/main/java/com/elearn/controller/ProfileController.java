package com.elearn.controller;

import com.elearn.model.Student;
import com.elearn.model.Users;
import com.elearn.service.StudentService;
import com.elearn.service.UserService;
import com.elearn.util.ImageResizer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class ProfileController {

    private StudentService studentService;

    private UserService userService;

    @Autowired
    public ProfileController(StudentService studentService, UserService userService) {
        this.studentService = studentService;
        this.userService = userService;
    }

    @InitBinder
    public void myInitBiner(WebDataBinder binder) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        binder.registerCustomEditor(Date.class, "dob", new CustomDateEditor(format, false));
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String loadProfilePage(Model model, HttpServletRequest request) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("username", user.getUsername());
        model.addAttribute("authorities", user.getAuthorities());
        model.addAttribute("page", "profile_page");
        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));
        return "/index";
    }

    @RequestMapping(value = "/updateStudentInfo", method = RequestMethod.POST)
    public String updateStudentInfo(Student student, Model model) {
        System.out.println("====" + student.toString());

        try {
            studentService.updateData(student);
            model.addAttribute("sm", "Student Info update successfully");
        } catch (Exception ex) {
            model.addAttribute("em", "Student Info not update");
            Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/profile";
    }

    @RequestMapping(value = "/updateUserInfo", method = RequestMethod.POST)
    public String updateUserInfo(@Valid Users users, Model model, BindingResult result) {

        Users u = userService.getUserByUserName(users.getUsername());

        u.setFirstName(users.getFirstName());
        u.setLastName(users.getLastName());
        u.setGender(users.getGender());
        u.setEmail(users.getEmail());
        u.setDob(users.getDob());
        u.setMobile(users.getMobile());

        try {
            userService.updateData(u);
            model.addAttribute("sm", "User info update successfully");
        } catch (Exception ex) {
            model.addAttribute("sm", "User info not update");
            Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/profile";

    }

    @RequestMapping(value = "/updateUserPhoto", method = RequestMethod.POST)
    public String updateUserPhoto(Model model, Users users, HttpServletRequest request, @RequestParam("file") MultipartFile file) {

        String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
        String name = timeStamp + ".png";


        Users existingImage = userService.getUserByUserName(users.getUsername());

        String deleteImage = existingImage.getPhoto();

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();

                // constructs the directory path to store upload file // this path is relative to application's directory
                String dbpath = request.getSession().getServletContext().getRealPath("/");
                String webcut = dbpath.substring(0, dbpath.lastIndexOf("/"));
                String buildcut = webcut.substring(0, webcut.lastIndexOf("/"));
                String mainURLPath = buildcut.substring(0, buildcut.lastIndexOf("/"));

                // Creating the directory to store file
                //thir
                String rootPath = mainURLPath;
                File dir = new File(rootPath + "/main/webapp/resources/upload/user_photo");
                if (!dir.exists()) {
                    dir.mkdirs();
                }



                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath() + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();

                Files.delete(Paths.get("src/main/webapp/resources/"+deleteImage));

                System.out.println("======== Server File Location="
                        + serverFile.getAbsolutePath());

                ImageResizer.resize(dir + "/" + name, dir + "/" + name, 200, 200);

                //return "You successfully uploaded file=" + name;
            } catch (Exception e) {
                System.out.println("You failed to upload " + name + " => " + e.getMessage());
            }
        } else {
            System.out.println("You failed to upload " + name + " because the file was empty.");
        }

        users.setPhoto("upload/user_photo/"+name);

        System.out.println("===" + users.getUsername());
        System.out.println("===" + users.getPhoto());

        Users u = userService.getUserByUserName(users.getUsername());
        u.setPhoto(users.getPhoto());

        try {
            userService.updateData(u);
            model.addAttribute("sm", "Photo Update successfull");
        } catch (Exception ex) {
            model.addAttribute("sm", "Photo not Update");
            Logger.getLogger(ProfileController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/profile";
    }


}
