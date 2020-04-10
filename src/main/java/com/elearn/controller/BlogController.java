package com.elearn.controller;

import com.elearn.model.Posts;
import com.elearn.model.Ratings;
import com.elearn.restcontroller.RatingsrestController;
import com.elearn.service.PostsService;
import com.elearn.service.RatingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
public class BlogController {



    private PostsService postsService;

    private RatingsService ratingsService;

    @Autowired
    public BlogController(PostsService postsService, RatingsService ratingsService) {
        this.postsService = postsService;
        this.ratingsService = ratingsService;
    }

    @RequestMapping(value = "/blog", method = RequestMethod.GET)
    public String loadBlogPage(Model model) {
        model.addAttribute("page", "blog_page");
        return "index";
    }

    @RequestMapping(value = "/single_blog/{postId}", method = RequestMethod.GET)
    public String loadSingleBlogPage(Model model, @PathVariable("postId") int postId) {
        try {
            Posts p = postsService.findData(postId);
            p.setViews(p.getViews() + 1);
            postsService.updateData(p);
            model.addAttribute("post", postsService.findData(postId));
        } catch (Exception ex) {
            Logger.getLogger(BlogController.class.getName()).log(Level.SEVERE, null, ex);
        }

//        try {
//            //ratings find
//            int ratingNumber = 0;
//            List<Ratings> ratingList = ratingsDao.findRatingsByBlogPostId(postId);
//            if (ratingList.size() > 0) {
//                for (Ratings rating : ratingList) {
//                    ratingNumber = ratingNumber + rating.getRating();
//                }
//                ratingNumber = ratingNumber / ratingList.size();
//            }
//            model.addAttribute("rating", ratingNumber);
//            System.out.println("=== " + ratingNumber);
//        } catch (Exception e) {
//        }

        try {
            User u = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            model.addAttribute("username", u.getUsername());
            System.out.println(u.getUsername());
        } catch (Exception e) {
            System.out.println("no user name");
        }
        model.addAttribute("page", "single_blog_page");
        return "index";
    }

    @RequestMapping(value = "/savePostRatings", method = RequestMethod.POST)
    public String savePostRatings(Ratings r) {

        try {
            User u = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            if(u != null) {
                r.setUsername(u.getUsername());
                ratingsService.saveData(r);
            }else {
                return "redirect:/single_blog/" + r.getPostId();
            }
        } catch (Exception ex) {
            Logger.getLogger(RatingsrestController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "redirect:/single_blog/" + r.getPostId();
    }


}
