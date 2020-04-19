package com.elearn.admincontroller;

import com.elearn.model.Authorities;
import com.elearn.model.UserRole;
import com.elearn.model.Users;
import com.elearn.service.UserRoleService;
import com.elearn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
@RequestMapping("/admin")
public class UsersController {



    private UserService userService;

    private UserRoleService userRoleService;

    @Autowired
    public UsersController(UserService userService, UserRoleService userRoleService) {
        this.userService = userService;
        this.userRoleService = userRoleService;
    }

    @InitBinder
    public void myInitBiner(WebDataBinder binder) {
        SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
        binder.registerCustomEditor(Date.class, "registerDate", new CustomDateEditor(format, false));
    }

    @RequestMapping(value = "/add_user", method = RequestMethod.GET)
    public String loadAddUserPage(HttpServletRequest request, Model model) {
        model.addAttribute(new Users());
        model.addAttribute("userRoles", userRoleService.getAllUserRole());
        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));
        return "/admin/add_user";
    }

    @RequestMapping(value = "/list_user", method = RequestMethod.GET)
    public String loadListUserPage(Model model, Users users, HttpServletRequest request) {
        model.addAttribute("users", userService.getAllData());
        model.addAttribute("userRoles", userRoleService.getAllUserRole());
        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));
        return "/admin/list_user";
    }

    @RequestMapping(value = "/saveUser", method = RequestMethod.POST)
    public String saveUsers(Model model, HttpServletRequest request, @Valid Users users, Authorities authorities, BindingResult result) {

        if (users.getUsername().isEmpty()) {
            model.addAttribute("em", "Please enter user name");
        } else if (users.getEmail().isEmpty()) {
            model.addAttribute("em", "Please enter valid email address");
        } else if (users.getPassword().isEmpty()) {
            model.addAttribute("em", "Please enter password");
        } else if (users.getAuthority() == null) {
            model.addAttribute("em", "Please select User Role");
        }

        System.out.println("=======" + users.toString());


        try {
            boolean status = userService.saveUserWithAuthority(users, authorities);
            if (status) {
                model.addAttribute("sm", "User info saved successfully");
            } else {
                model.addAttribute("em", "User info not saved");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return "redirect:/admin/add_user";
    }

    @RequestMapping(value = "/saveUserRole", method = RequestMethod.POST)
    public String saveUserRole(Model model, @Valid UserRole userRole, BindingResult result) {

        String modifiedRole = "ROLE_" + userRole.getRoleName().toUpperCase().trim();
        userRole.setRoleName(modifiedRole);
        if (userRole.getRoleName().isEmpty()) {
            model.addAttribute("em", "Please enter Role Name");
            return "redirect:/admin/add_user";
        }

        try {
            boolean status = userRoleService.saveData(userRole);
            if (status) {
                model.addAttribute("sm", "User Role Create Successfully");
            }
        } catch (Exception ex) {
            model.addAttribute("em", "User role Not Create");
            ex.printStackTrace();
        }

        return "redirect:/admin/add_user";
    }

    @RequestMapping(value = "/update_user_status/{id}/{status}", method = RequestMethod.GET)
    public String updateUserStatus(Model model, @PathVariable("id") int id, @PathVariable("status") boolean status) {

        boolean u_status = !status;

        Users users = new Users();
        users.setUserId(id);
        users.setEnabled(u_status);

        try {
            boolean stat = userService.updateUserStatus(users);
            if (stat) {
                model.addAttribute("sm", "Status Update successfull");
            } else {
                model.addAttribute("em", "Status Not Update");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return "redirect:/admin/list_user";
    }

    @RequestMapping(value = "/edit_user/{id}", method = RequestMethod.GET)
    public String editUser(@PathVariable("id") int id, Model model, HttpServletRequest request) {

        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));

        try {
            model.addAttribute("user", userService.findData(id));
            model.addAttribute("userRoles", userRoleService.getAllUserRole());
        } catch (Exception ex) {
            Logger.getLogger(UsersController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "/admin/edit_user";
    }

    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public String updateUser(Model model, Users users, Authorities authorities) {

        try {
            boolean status = userService.updateData(users, authorities);
            if (status) {
                model.addAttribute("sm", "User Info update successfull");
            } else {
                model.addAttribute("em", "User Info not update");
            }
        } catch (Exception ex) {
            model.addAttribute("em", "User Info not update");
            ex.printStackTrace();
        }

        return "redirect:/admin/edit_user/" + users.getUserId();
    }

    @RequestMapping(value = "/delete_user/{id}", method = RequestMethod.GET)
    public String deleteUser(Model model, @PathVariable("id") int id) {

        try {
            boolean status = userService.deleteUserById(id);
            if (status) {
                model.addAttribute("sm", "User Info deleted successfully");
            }
        } catch (Exception ex) {
            model.addAttribute("em", "User Info not deleted");
            Logger.getLogger(UsersController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/admin/list_user";
    }

    @RequestMapping(value = "/delete_user_role/{id}", method = RequestMethod.GET)
    public String deleteUserRole(@PathVariable("id") int id, Model model) {
        try {
            userRoleService.deleteRoleById(id);
            model.addAttribute("sm", "Role Delete successfully");
        } catch (Exception ex) {
            model.addAttribute("em", "Role Not Delete");
            ex.printStackTrace();
        }

        return "redirect:/admin/list_user";
    }


}