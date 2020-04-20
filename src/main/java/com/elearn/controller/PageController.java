package com.elearn.controller;

import java.security.Principal;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PageController {


    @GetMapping("/")
    public String loadHomePage(Model model) {
        System.out.println("enter index controller \n\n\n\n");

        model.addAttribute("page", "home_page");

   //     User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

    //    System.out.println(user.getAuthorities());
        return "index";
    }
	
    
//	@GetMapping("/")
//	@ResponseBody
//	public String homeView() {
//		
//		return "Hello world";
//	}

    @RequestMapping("/courses")
    public String loadCoursesPage(Model model) {
        model.addAttribute("page", "courses_page");
        return "index";
    }

    @RequestMapping("/course/{id}")
    public String loadCoursePage(Model model, @PathVariable("id") int id,Principal principal) {
        model.addAttribute("page", "course_page");
        model.addAttribute("courseId", id);

        try {

            //Authentication auth = SecurityContextHolder.getContext().getAuthentication();
           // User u = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        	if(principal != null) {
                model.addAttribute("username", principal.getName());
            	}
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "index";


    }



    @RequestMapping("/contact")
    public String loadContactPage(Model model) {
        model.addAttribute("page", "contact_page");
        return "index";
    }

}
