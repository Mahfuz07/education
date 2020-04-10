package com.elearn.serviceimp;

import com.elearn.model.Course;
import com.elearn.model.Lesson;
import com.elearn.repository.CourseRepository;
import com.elearn.repository.LessonRepository;
import com.elearn.service.LessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class LessonServiceImp implements LessonService {

    private CourseRepository courseRepository;

    private LessonRepository lessonRepository;

    @Autowired
    public LessonServiceImp(LessonRepository lessonRepository,CourseRepository courseRepository) {
        this.lessonRepository = lessonRepository;
        this.courseRepository = courseRepository;
    }


    @Override
    public Lesson getLessonByLessonId(int id) {
        return lessonRepository.findByLessonId(id);
    }

    @Override
    public boolean saveLessonPPTFile(Lesson obj) {

        Lesson lesson = lessonRepository.findByLessonId(obj.getLessonId());

        lesson.setPresentationFile(obj.getPresentationFile());
        lessonRepository.save(lesson);
        return true;
    }

    @Override
    public boolean saveLessonNotesFile(Lesson obj) {

        Lesson lesson = lessonRepository.findByLessonId(obj.getLessonId());

        lesson.setNotesFile(obj.getNotesFile());
        lessonRepository.save(lesson);
        return true;
    }

    // i want to do this later



    // i want to do this later

    @Override
    public boolean updateLessonStatus(Lesson obj) {

        Lesson lesson = lessonRepository.findByLessonId(obj.getLessonId());

        lesson.setStatus(obj.isStatus());
        lessonRepository.save(lesson);
        return true;
    }

    @Override
    public boolean updateLesson(Lesson l) {

        Lesson lesson = lessonRepository.findByLessonId(l.getLessonId());

        lesson.setCourse(l.getCourse());
        lesson.setLessonTitle(l.getLessonTitle());
        lesson.setDescription(l.getDescription());
        lessonRepository.save(lesson);

        return true;
    }

    @Override
    public List<Lesson> getAllLessonWithCourse() {
        return lessonRepository.getAllLessonWithCourse();
    }

    @Override
    public Lesson findLessonWithCourseByLessonId(int id) {
        return lessonRepository.findLessonWithCourseByLessonId(id);
    }

    @Override
    public List<Lesson> getAllLessonName() {
        return lessonRepository.findAll();
    }

    @Override
    public boolean saveData(Lesson obj) {

        lessonRepository.save(obj);
        return true;
    }

    @Override
    public boolean deleteData(Lesson obj) {

        lessonRepository.deleteById(obj.getLessonId());

        return true;
    }

    @Override
    public List<Lesson> getAllData() {
        return lessonRepository.findAll();
    }

    @Override
    public List<Lesson> getLessonByCourseIdByJDBC(int id) {
        Course course = courseRepository.findByCourseId(id);

        List<Lesson> lesson = lessonRepository.findAllByCourse(course);

        List<Lesson> les = new ArrayList<>();

        for(Lesson less : lesson) {
            //LessonDto lesson =  new LessonDto();

            Lesson lesso = new Lesson();
            lesso.setLessonId(less.getLessonId());
            lesso.setLessonTitle(less.getLessonTitle());
            les.add(lesso);
        }

        return les;
    }


}
