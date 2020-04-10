package com.elearn.restcontroller;

import com.elearn.model.Comments;
import com.elearn.repository.CommentsRepository;
import com.elearn.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@RestController
@RequestMapping(value = "/comments")
public class CommentsRestController {


    private CommentService commentService;

    @Autowired
    public CommentsRestController(CommentService commentService) {
        this.commentService = commentService;
    }

    @RequestMapping(value = "/saveComments", method = RequestMethod.POST)
    public Comments saveComment(@RequestBody Comments comments){

        System.out.println("===" + comments.toString());

        try {
            commentService.saveData(comments);
        } catch (Exception ex) {
            Logger.getLogger(CommentsRestController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return comments;
    }

    @RequestMapping(value = "/allCommentsByTopicsId/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
    public List<Comments> getAllComments(@PathVariable("id") int id){
        return commentService.getAllCommentsByTopicsId(id);
    }

//    @RequestMapping(value = "/allCommentsDetailsByTopicsId/{id}", method = RequestMethod.GET, headers = "Accept=application/json")
//    public List<Comments> getAllCommentsDetails(@PathVariable("id") int id){
//        return commentsDao.getAllCommentsDetailsByTopicsId(id);
//    }



}
