package com.elearn.model;


import javax.persistence.*;

import org.hibernate.annotations.Type;

import java.util.HashSet;
import java.util.Set;

@Entity
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "courseId", unique = true, nullable = false)
    private Integer courseId;

    @Column(name = "courseName", nullable = false, length = 100)
    private String courseName;

    @Column(name = "courseCode", nullable = false, length = 45)
    private String courseCode;

    @Column(name = "description")
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String description;

    @Column(name = "status", nullable = false)
    private boolean status;

    @Column(name = "courseDuration")
    private Integer courseDuration;

    @Column(name = "courseBook")
    private String courseBook;

    @Column(name = "introVideo")
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String introVideo;

    @OneToMany(targetEntity = Lesson.class,fetch = FetchType.LAZY, mappedBy = "course")
    private Set<Lesson> lessons = new HashSet<Lesson>(0);

    public Course() {
    }

    public Course(String courseName, String courseCode, boolean status) {
        this.courseName = courseName;
        this.courseCode = courseCode;
        this.status = status;
    }

    public Course(String courseName, String courseCode, String description, boolean status, Integer courseDuration, String courseBook, String introVideo, Set<Lesson> lessons) {
        this.courseName = courseName;
        this.courseCode = courseCode;
        this.description = description;
        this.status = status;
        this.courseDuration = courseDuration;
        this.courseBook = courseBook;
        this.introVideo = introVideo;
        this.lessons = lessons;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseCode() {
        return courseCode;
    }

    public void setCourseCode(String courseCode) {
        this.courseCode = courseCode;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Integer getCourseDuration() {
        return courseDuration;
    }

    public void setCourseDuration(Integer courseDuration) {
        this.courseDuration = courseDuration;
    }

    public String getCourseBook() {
        return courseBook;
    }

    public void setCourseBook(String courseBook) {
        this.courseBook = courseBook;
    }

    public String getIntroVideo() {
        return introVideo;
    }

    public void setIntroVideo(String introVideo) {
        this.introVideo = introVideo;
    }

    public Set<Lesson> getLessons() {
        return lessons;
    }

    public void setLessons(Set<Lesson> lessons) {
        this.lessons = lessons;
    }
}
