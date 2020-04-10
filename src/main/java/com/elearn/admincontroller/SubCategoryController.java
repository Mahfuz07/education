package com.elearn.admincontroller;

import com.elearn.model.Category;
import com.elearn.model.SubCategory;
import com.elearn.service.CategoryService;
import com.elearn.service.SubCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
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
public class SubCategoryController {


    private SubCategoryService subCategoryService;

    private CategoryService categoryService;

    @Autowired
    public SubCategoryController(SubCategoryService subCategoryService, CategoryService categoryService) {
        this.subCategoryService = subCategoryService;
        this.categoryService = categoryService;
    }

    @RequestMapping(value = "/add_sub_category", method = RequestMethod.GET)
    public String loadAddSubCategory(Model model, HttpServletRequest request){
        model.addAttribute("categories", categoryService.getAllData());
        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));
        return "/admin/add_sub_category";
    }

    @RequestMapping(value = "/saveSubCategory", method = RequestMethod.POST)
    public String saveSubCategory(SubCategory subCategory, Model model){
        if(subCategory.getCategoryId() == 0){
            model.addAttribute("em", "Select Category Name");
            return "redirect:/admin/add_sub_category";
        }

        try {
            boolean status = subCategoryService.saveData(subCategory);
            model.addAttribute("sm", "Sub Category info saved successfully");
        } catch (Exception ex) {
            Logger.getLogger(SubCategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/admin/add_sub_category";
    }

    @RequestMapping(value = "/list_sub_category", method = RequestMethod.GET)
    public String loadListSubCategory(Model model, HttpServletRequest request){
        model.addAttribute("subCategoires", subCategoryService.getAllData());
        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));
        return "/admin/list_sub_category";
    }

    @RequestMapping(value = "/update_sub_category_status/{id}/{status}", method = RequestMethod.GET)
    public String updateSubCategoryStatus(@PathVariable("id") int id, @PathVariable("status") boolean status, Model model){
        try {
            SubCategory sc = subCategoryService.findData(id);
            sc.setStatus(!status);
            subCategoryService.updateData(sc);
            model.addAttribute("sm", "Status update successfull");
        } catch (Exception ex) {
            Logger.getLogger(SubCategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "redirect:/admin/list_sub_category";
    }

    @RequestMapping(value = "/edit_sub_category/{id}", method = RequestMethod.GET)
    public String editSubCategory(@PathVariable("id") int id, Model model, HttpServletRequest request){
        try {
            model.addAttribute("subCategory", subCategoryService.findData(id));
        } catch (Exception ex) {
            Logger.getLogger(SubCategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
        model.addAttribute("categories", categoryService.getAllData());
        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));
        return "/admin/edit_sub_category";
    }

    @RequestMapping(value = "/updateSubCategory", method = RequestMethod.POST)
    public String updateSubCategory(Model model, SubCategory subCategory){

        try {
            SubCategory sc = subCategoryService.findData(subCategory.getSubCategoryId());
            sc.setDescription(subCategory.getDescription());
            sc.setSubCategoryName(subCategory.getSubCategoryName());
            sc.setCategoryId(subCategory.getCategoryId());
            subCategoryService.updateData(sc);
            model.addAttribute("sm", "Sub Category Inof Update successfull");
        } catch (Exception ex) {
            Logger.getLogger(SubCategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/admin/edit_sub_category/" + subCategory.getSubCategoryId();
    }

    @RequestMapping(value = "/delete_sub_category/{id}")
    public String deleteSubCategory(Model model, @PathVariable("id") int id){

        try {
            SubCategory sc =  subCategoryService.findData( id);
            subCategoryService.deleteData(sc);
            model.addAttribute("sm", "Info deleted successfully");
        } catch (Exception ex) {
            Logger.getLogger(SubCategoryController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/admin/list_sub_category";
    }

}
