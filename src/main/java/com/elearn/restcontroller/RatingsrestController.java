package com.elearn.restcontroller;

import com.elearn.model.Ratings;
import com.elearn.service.RatingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@RestController
@RequestMapping("/ratings")
public class RatingsrestController {


    private RatingsService ratingsService;

    @Autowired
    public RatingsrestController(RatingsService ratingsService) {
        this.ratingsService = ratingsService;
    }

    @RequestMapping(value = "/savePostRatings", method = RequestMethod.POST, headers = "Accept=application/json")
    public Ratings savePostRatings(@RequestBody Ratings r) {
        User u = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        r.setUsername(u.getUsername());
        try {
            ratingsService.saveData(r);
        } catch (Exception ex) {
            Logger.getLogger(RatingsrestController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return r;
    }

    @RequestMapping(value = "/getAllRatingsByPostsId/{pid}", method = RequestMethod.POST, headers = "Accept=application/json")
    public List<Ratings> getAllRatingsByPostsId(@PathVariable("pid") int pid){
        try {
            return ratingsService.findRatingsByBlogPostId(pid);
        } catch (Exception ex) {
            Logger.getLogger(RatingsrestController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
