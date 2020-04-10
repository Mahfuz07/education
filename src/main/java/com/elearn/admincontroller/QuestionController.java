package com.elearn.admincontroller;


import com.elearn.model.Question;
import com.elearn.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
@RequestMapping(value = "/admin")
public class QuestionController {


    private QuestionService questionService;

    @Autowired
    public QuestionController(QuestionService questionService) {
        this.questionService = questionService;
    }

    @RequestMapping(value = "/add_question", method = RequestMethod.GET)
    public String loadAddQuestion(Model model, HttpServletRequest request) {

        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));
        return "/admin/add_question";
    }

    @RequestMapping(value = "/saveQuestion", method = RequestMethod.POST)
    public String saveQuestion(Question question, Model model) {

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        question.setUserName(user.getUsername());
        question.setStatus(true);
        System.out.println("====" + question.toString());

        try {
            boolean status = questionService.saveData(question);
            if (status) {
                model.addAttribute("sm", "Question create Sucessfull");
            }
        } catch (Exception ex) {
            model.addAttribute("sm", "Question not create");
            Logger.getLogger(QuestionController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/admin/add_question";
    }

    @RequestMapping(value = "/list_question", method = RequestMethod.GET)
    public String loadManageQuestion(Model model, HttpServletRequest request) {
        model.addAttribute("questions", questionService.getAllData());

        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));
        return "/admin/list_question";
    }

    @RequestMapping(value = "/update_question_status/{id}/{status}", method = RequestMethod.GET)
    public String updateQuestionStatus(@PathVariable("status") boolean status, @PathVariable("id") int id, Model model) {

        Question q;
        try {
            q = questionService.findData(id);
            q.setStatus(!status);
            questionService.updateData(q);
            model.addAttribute("sm", "Status Update Successfull");
        } catch (Exception ex) {
            Logger.getLogger(QuestionController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/admin/list_question";
    }

    @RequestMapping(value = "/delete_question/{id}")
    public String deleteQuestion(@PathVariable("id") int id, Model model) {

        Question q = new Question();
        q.setQuestionId(id);
        try {
            questionService.deleteData(q);
            model.addAttribute("sm", "Question Deleted Successfully");
        } catch (Exception ex) {
            Logger.getLogger(QuestionController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/admin/list_question";
    }

    @RequestMapping(value = "/edit_question/{id}", method = RequestMethod.GET)
    public String editQuestion(@PathVariable("id") int id, Model model, HttpServletRequest request) {
        try {
            model.addAttribute("question", questionService.findData(id));
        } catch (Exception ex) {
            Logger.getLogger(QuestionController.class.getName()).log(Level.SEVERE, null, ex);
        }
        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));
        return "/admin/edit_question";
    }

    @RequestMapping(value = "/updateQuestion", method = RequestMethod.POST)
    public String updateQuestion(Question question, Model model) {

        try {
            Question q = questionService.findData(question.getQuestionId());
            q.setQuestionType(question.getQuestionType());
            q.setAone(question.getAone());
            q.setAtwo(question.getAtwo());
            q.setAthree(question.getAthree());
            q.setAfour(question.getAfour());
            q.setCanswer(question.getCanswer());
            questionService.updateData(q);
            model.addAttribute("sm", "question update successfull");

        } catch (Exception ex) {
            Logger.getLogger(QuestionController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/admin/edit_question/" + question.getQuestionId();
    }


}
