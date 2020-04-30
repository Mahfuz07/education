package com.elearn.admincontroller;

import com.elearn.model.Course;
import com.elearn.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

@Controller
@RequestMapping("/admin")
public class CourseController {


    private CourseService courseService;

    @Autowired
    public CourseController(CourseService courseService) {
        this.courseService = courseService;
    }

    @RequestMapping(value = "/add_course", method = RequestMethod.GET)
    public String loadAddCourse(Model model, HttpServletRequest request) {
        model.addAttribute("courses", courseService.getAllData());
        model.addAttribute("course", new Course());
        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));
        return "/admin/add_course";
    }

    @RequestMapping(value = "/list_course", method = RequestMethod.GET)
    public String loadManageCourse(Model model, HttpServletRequest request){
        model.addAttribute("courses", courseService.getAllData());
        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));
        return "/admin/list_course";
    }

    @RequestMapping(value = "/saveCourse", method = RequestMethod.POST)
    public String saveCourse(Model model, Course course) {

        try {
            courseService.saveData(course);
            model.addAttribute("sm", "Course Created Successfully");
        } catch (Exception ex) {
            model.addAttribute("em", "Course Not created");
            ex.printStackTrace();
        }

        return "redirect:/admin/add_course";
    }

    @RequestMapping(value = "/update_course_status/{id}/{status}", method = RequestMethod.GET)
    public String updateUserStatus(Model model, @PathVariable("id") int id, @PathVariable("status") boolean status) {

        boolean c_status = !status;

        Course course = new Course();
        course.setCourseId(id);
        course.setStatus(c_status);

        try {
            boolean stat = courseService.updateCourseStatus(course);
            if (stat) {
                model.addAttribute("sm", "Status Update successfull");
            } else {
                model.addAttribute("em", "Status Not Update");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return "redirect:/admin/list_course";
    }

    @RequestMapping(value = "/editCourse/{id}", method = RequestMethod.GET)
    public String editCourse(@PathVariable("id") int id, Model model) {

        try {
            Course course = courseService.findData(id);
            model.addAttribute("course", course);
        } catch (Exception ex) {
            model.addAttribute("course", new Course());
            Logger.getLogger(CourseController.class.getName()).log(Level.SEVERE, null, ex);
        }

        model.addAttribute("courses", courseService.getAllData());
        return "/admin/add_course";
    }

    @RequestMapping(value = "/updateCourse", method = RequestMethod.POST)
    public String updateCourse(Model model, Course course) {

        try {
            boolean status = courseService.updteCourse(course);
            Course c = courseService.findData(course.getCourseId());
            model.addAttribute("course", c);
            if (status) {
                model.addAttribute("sm", "Course Info Update successfull");
            } else {
                model.addAttribute("em", "Course Info Not Update");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return "redirect:/admin/editCourse/" + course.getCourseId();
    }

    @RequestMapping(value = "/deleteCourse/{id}", method = RequestMethod.GET)
    public String deleteCourse(@PathVariable("id") int id, Model model) {
        Course course = new Course();
        course.setCourseId(id);
        try {
            courseService.deleteData(course);
            model.addAttribute("sm", "Course Info deleted successfull");
        } catch (Exception ex) {
            model.addAttribute("em", "Course Info not delete");
            ex.printStackTrace();
        }
        return "redirect:/admin/list_course";
    }



    @RequestMapping(value = "/editCourseVideo/{id}", method = RequestMethod.GET)
    public String editCourseVideo(@PathVariable("id") int id, Model model, HttpServletRequest request){

        try {
            model.addAttribute("course", courseService.findData(id));
        } catch (Exception ex) {
            Logger.getLogger(CourseController.class.getName()).log(Level.SEVERE, null, ex);
        }
        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));
        return "/admin/edit_course_video";
    }

    @RequestMapping(value = "/updateCourseVideoUrl", method = RequestMethod.POST)
    public String updateCourseVideoUrl(Course course, Model model, HttpServletRequest request){

       

        try {
        	 String s = request.getParameter("introVideo");
             int startIndex = s.indexOf("https://");
             int endIndex = s.indexOf("frameborder");
             String cut = s.substring(startIndex, endIndex-2);
             course.setIntroVideo(cut);
            courseService.updteCourseVideo(course);
            model.addAttribute("sm", "Course Video Update successfully");
        } catch (Exception ex) {
            model.addAttribute("em", "Video not update .Please use video embed code!");
            Logger.getLogger(CourseController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/admin/editCourseVideo/" + course.getCourseId();

    }

    @RequestMapping(value = "/editCourseBook/{id}", method = RequestMethod.GET)
    public String editCourseBook(@PathVariable("id") int id, Model model, HttpServletRequest request){

        try {
            model.addAttribute("course", courseService.findData(id));
        } catch (Exception ex) {
            Logger.getLogger(CourseController.class.getName()).log(Level.SEVERE, null, ex);
        }
        model.addAttribute("sm", request.getParameter("sm"));
        model.addAttribute("em", request.getParameter("em"));
        return "/admin/add_course_book";
    }

    /**
     * Upload single file using Spring Controller
     */
    @RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
    public String uploadFileHandler(@RequestParam("courseId") int courseId, @RequestParam("file") MultipartFile file, Model model, HttpServletRequest request) {

        String timeStamp = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
        String name = timeStamp + ".pdf";

        Course existingImage = courseService.findData(courseId);

        String deleteImage = existingImage.getCourseBook();

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();

                // constructs the directory path to store upload file // this path is relative to application's directory
                String dbpath = request.getSession().getServletContext().getRealPath("/");
                String webcut = dbpath.substring(0, dbpath.lastIndexOf("/"));
                String buildcut = webcut.substring(0, webcut.lastIndexOf("/"));
                String mainURLPath = buildcut.substring(0, buildcut.lastIndexOf("/"));

                // Creating the directory to store file
                //thir
                String rootPath = mainURLPath;
                File dir = new File(rootPath + "/main/webapp/resources/upload/course_book_pdf");
                if (!dir.exists()) {
                    dir.mkdirs();
                }

                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath() + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();

                Files.delete(Paths.get("src/main/webapp/resources/"+deleteImage));

                System.out.println("======== Server File Location="
                        + serverFile.getAbsolutePath());

                //return "You successfully uploaded file=" + name;
            } catch (Exception e) {
                System.out.println("You failed to upload " + name + " => " + e.getMessage());
            }
        } else {
            System.out.println("You failed to upload " + name + " because the file was empty.");
        }

        //upload  info on database
        Course course = new Course();
        course.setCourseId(courseId);
        course.setCourseBook("upload/course_book_pdf/" + name);

        try {
            boolean status = courseService.saveCourseBookFile(course);
            if (status) {
                model.addAttribute("sm", "Course Book PDF file upload successfull");
            } else {
                model.addAttribute("em", "file not upload");
            }
        } catch (Exception ex) {
            Logger.getLogger(CourseController.class.getName()).log(Level.SEVERE, null, ex);
        }

        return "redirect:/admin/editCourseBook/" + courseId;
    }


}
