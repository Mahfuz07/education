package com.elearn.serviceimp;

import com.elearn.model.Course;
import com.elearn.model.Lesson;
import com.elearn.model.Topics;
import com.elearn.repository.CourseRepository;
import com.elearn.repository.LessonRepository;
import com.elearn.repository.TopicsRepository;
import com.elearn.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class CourseServiceImp implements CourseService {

    private CourseRepository courseRepository;
    private LessonRepository lessonRepository;
    private TopicsRepository topicsRepository;

    @Autowired
    public CourseServiceImp(CourseRepository courseRepository, LessonRepository lessonRepository, TopicsRepository topicsRepository) {
        this.courseRepository = courseRepository;
        this.lessonRepository = lessonRepository;
        this.topicsRepository = topicsRepository;
    }

    @Override
    public boolean updateCourseStatus(Course obj) {

        Course course = courseRepository.findByCourseId(obj.getCourseId());

        course.setStatus(obj.isStatus());
        courseRepository.save(course);
        return true;
    }

    @Override
    public boolean updteCourse(Course obj) {

        Course course = courseRepository.findByCourseId(obj.getCourseId());

        course.setCourseCode(obj.getCourseCode());
        course.setCourseName(obj.getCourseName());
        course.setDescription(obj.getDescription());
        courseRepository.save(course);

        return true;
    }

    @Override
    public boolean saveCourseBookFile(Course obj) {

        Course course = courseRepository.findByCourseId(obj.getCourseId());
        course.setCourseBook(obj.getCourseBook());
        courseRepository.save(course);
        return true;
    }

    @Override
    public List<Course> getAllCourseName() {

        List<Course> course = courseRepository.findAll();

        List<Course> courses = new ArrayList<>();

        for(Course cou: course){
            Course cour = new Course();

            cour.setCourseId(cou.getCourseId());
            cour.setCourseName(cou.getCourseName());
            courses.add(cour);
        }

        return courses;
    }

    //CourseRestController



    @Override
    public List<Course> getAllCourseWithLessonAndTopics() {


        Map<Integer, Course> map = new HashMap<Integer, Course>();
        Course course = null;
        Lesson lesson = null;

        List<Course> course1 = courseRepository.findAll();

        for(Course course2: course1) {
            course = map.get(course2.getCourseId());

            if (course == null) {
                course = new Course();
                course.setCourseId(course2.getCourseId());
                course.setCourseName(course2.getCourseName());
                course.setCourseBook(course2.getCourseBook());
                course.setIntroVideo(course2.getIntroVideo());
                course.setLessons(new HashSet<Lesson>());

            }
            map.put(course2.getCourseId(), course);


            List<Lesson> lessonl = lessonRepository.findAllByCourse(course);

            for (Lesson lesson2 : lessonl) {
                if (lesson2.getLessonId() > 0) {
                    if (course.getLessons().size() > 0) {
                        boolean stat = true;
                        for (Lesson l : course.getLessons()) {
                            if (l.getLessonId() == lesson2.getLessonId()) {
                                stat = false;
                                break;
                            }
                        }
                        if (stat) {
                            lesson = new Lesson();
                            lesson.setLessonId(lesson2.getLessonId());
                            lesson.setLessonTitle(lesson2.getLessonTitle());
                            lesson.setNotesFile(lesson2.getNotesFile());
                            lesson.setPresentationFile(lesson2.getPresentationFile());
                            lesson.setTopicses(new HashSet<Topics>());
                            course.getLessons().add(lesson);
                        }
                    } else {
                        lesson = new Lesson();
                        lesson.setLessonId(lesson2.getLessonId());
                        lesson.setLessonTitle(lesson2.getLessonTitle());
                        lesson.setNotesFile(lesson2.getNotesFile());
                        lesson.setPresentationFile(lesson2.getPresentationFile());
                        lesson.setTopicses(new HashSet<Topics>());
                        course.getLessons().add(lesson);
                    }
                }

            }
            List<Topics> topics1 = topicsRepository.findAllByLesson(lesson);
            for (Topics topics2 : topics1) {
                if (topics2.getTopicsId() > 0) {
                    Topics topics = new Topics();
                    topics.setTopicsId(topics2.getTopicsId());
                    topics.setTopicsTitle(topics2.getTopicsTitle());
                    topics.setVideoUrl(topics2.getVideoUrl());
                    lesson.getTopicses().add(topics);
                }

            }
        }

        return new ArrayList<Course>(map.values());
    }

















    @Override
    public List<Course> getAllData() {
        return courseRepository.findAll();
    }

    @Override
    public boolean saveData(Course obj) {

        courseRepository.save(obj);
        return true;
    }

    @Override
    public Course findData(Integer courseId) {
        return courseRepository.findByCourseId(courseId);
    }

    @Override
    public boolean deleteData(Course obj) {

        courseRepository.deleteById(obj.getCourseId());

        return true;
    }

    @Override
    public boolean updteCourseVideo(Course obj) {

        Course course = courseRepository.findByCourseId(obj.getCourseId());

        course.setIntroVideo(obj.getIntroVideo());
        courseRepository.save(course);

        return true;
    }

    @Override
    public List<Course> getAllCourseInfo() {

        List<Course> course = courseRepository.findAll();

        List<Course> courses = new ArrayList<>();

        for(Course cou: course){

            Course cour = new Course();

            cour.setCourseId(cou.getCourseId());
            cour.setCourseName(cou.getCourseName());
            cour.setCourseBook(cou.getCourseBook());
            cour.setCourseCode(cou.getCourseCode());
            cour.setCourseDuration(cou.getCourseDuration());
            cour.setDescription(cou.getDescription());
            cour.setIntroVideo(cou.getIntroVideo());
            cour.setStatus(cou.isStatus());
            courses.add(cour);
        }


        return courses;
    }

    @Override
    public List<Course> getAllCourseWithLesson() {
        return courseRepository.getAllCourseWithLesson();
    }



    @Override
    public List<Course> getCourseWithDetailsByCourseId(Integer courseId) {


        Course course1 = courseRepository.findByCourseId(courseId);

        Map<Integer, Course> map = new HashMap<Integer, Course>();

        Course course = null;
        Lesson lesson = null;

        List<Lesson> lessonl = lessonRepository.findAllByCourse(course1);

        course = map.get(course1.getCourseId());

        if (course == null) {
            course = new Course();
            course.setCourseId(course1.getCourseId());
            course.setCourseName(course1.getCourseName());
            course.setCourseBook(course1.getCourseBook());
            course.setIntroVideo(course1.getIntroVideo());
            course.setLessons(new HashSet<Lesson>());
            map.put(course1.getCourseId(), course);
        }

        for(Lesson lesson2: lessonl) {
            if (lesson2.getLessonId() > 0) {
                if (course.getLessons().size() > 0) {
                    boolean stat = true;
                    for (Lesson l : course.getLessons()) {
                        if (l.getLessonId() == lesson2.getLessonId()) {
                            stat = false;
                            break;
                        }
                    }
                    if (stat) {
                        lesson = new Lesson();
                        lesson.setLessonId(lesson2.getLessonId());
                        lesson.setLessonTitle(lesson2.getLessonTitle());
                        lesson.setNotesFile(lesson2.getNotesFile());
                        lesson.setPresentationFile(lesson2.getPresentationFile());
                        lesson.setTopicses(new HashSet<Topics>());
                        course.getLessons().add(lesson);
                    }
                } else {
                    lesson = new Lesson();
                    lesson.setLessonId(lesson2.getLessonId());
                    lesson.setLessonTitle(lesson2.getLessonTitle());
                    lesson.setNotesFile(lesson2.getNotesFile());
                    lesson.setPresentationFile(lesson2.getPresentationFile());
                    lesson.setTopicses(new HashSet<Topics>());
                    course.getLessons().add(lesson);
                }
            }


            List<Topics> topics1 = topicsRepository.findAllByLesson(lesson);
            for (Topics topics2 : topics1) {
                if (topics2.getTopicsId() > 0) {
                    Topics topics = new Topics();
                    topics.setTopicsId(topics2.getTopicsId());
                    topics.setTopicsTitle(topics2.getTopicsTitle());
                    topics.setVideoUrl(topics2.getVideoUrl());
                    lesson.getTopicses().add(topics);
                }
            }
        }


        return new ArrayList<Course>(map.values());
    }





}
