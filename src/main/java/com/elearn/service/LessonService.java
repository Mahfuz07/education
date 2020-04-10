package com.elearn.service;

import com.elearn.model.Lesson;

import java.util.List;

public interface LessonService {

    public Lesson getLessonByLessonId(int id);

    public boolean saveLessonPPTFile(Lesson lesson);

    public boolean saveLessonNotesFile(Lesson lesson);





    public boolean updateLessonStatus(Lesson lesson);

    public boolean updateLesson(Lesson l);

    public List<Lesson> getAllLessonWithCourse();

    public Lesson findLessonWithCourseByLessonId(int id);

    public List<Lesson> getAllLessonName();

    public boolean saveData(Lesson obj);

    public boolean deleteData(Lesson obj);

    public List<Lesson> getAllData();

    public List<Lesson> getLessonByCourseIdByJDBC(int id);

}
