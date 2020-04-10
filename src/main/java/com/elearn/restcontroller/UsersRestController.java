package com.elearn.restcontroller;

import com.elearn.model.Users;
import com.elearn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(value = "/users")
public class UsersRestController {


    private UserService userService;

    @Autowired
    public UsersRestController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/allUsers", method = RequestMethod.GET)
    public List<Users> allUsers(){
        return userService.getAllData();
    }

    @RequestMapping(value = "/userByUserName/{username}", method = RequestMethod.GET, headers = "Accept=application/json")
    public Users getUserByUserName(@PathVariable("username") String username){
        return userService.getUserByUserName(username);
    }

}
