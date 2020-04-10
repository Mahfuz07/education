package com.elearn.controller;

import com.elearn.model.Authorities;
import com.elearn.model.Users;
import com.elearn.service.UserRoleService;
import com.elearn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class RegisterController {


    private UserService userService;

    private UserRoleService userRoleService;


    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public RegisterController(UserService userService, UserRoleService userRoleService,BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userService = userService;
        this.userRoleService = userRoleService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @InitBinder
    public void myInitBiner(WebDataBinder binder) {
        SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
        binder.registerCustomEditor(Date.class, "dob", new CustomDateEditor(format, false));
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String loadRegisterPage(Model model, HttpServletRequest request){
        model.addAttribute("userRoles", userRoleService.getAllUserRole());
        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));
        model.addAttribute("page", "register_page");
        return "index";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerCustomer(Model model, @Valid Users users, BindingResult result){

        if(users.getUserType().equals("ROLE_USER")){
            users.setEnabled(true);
        }else{
            users.setEnabled(false);
        }

        users.setAuthority(users.getUserType());
        users.setPassword(bCryptPasswordEncoder.encode(users.getPassword()));
        users.setRegisterDate(new Date());

        //set this user into authority table
        Authorities authorities = new Authorities();
        authorities.setAuthority(users.getAuthority());
        authorities.setUsername(users.getUsername());

        System.out.println("======" + users.toString());
        System.out.println("======" + authorities.toString());


        try {
            boolean status = userService.saveUserWithAuthority(users, authorities);
            if(status){
                model.addAttribute("sm", "Regster successfull");
            }else{
                model.addAttribute("em", "Register not successfull");
            }
        } catch (Exception ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }


        return "redirect:/register";
    }

}
