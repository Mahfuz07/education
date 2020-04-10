package com.elearn.restcontroller;


import com.elearn.model.Posts;
import com.elearn.service.PostsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@RestController
@RequestMapping(value = "/posts")
public class PostsRestController {

    private PostsService postsService;

    @Autowired
    public PostsRestController(PostsService postsService) {
        this.postsService = postsService;
    }

    @RequestMapping(value = "/allPosts", method = RequestMethod.GET)
    public ArrayList<Posts> getAllPosts(){
        return (ArrayList<Posts>) postsService.getAllData();
    }

}
