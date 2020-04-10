package com.elearn.model;


import javax.persistence.*;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Lesson {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "lessonId", unique = true, nullable = false)
    private Integer lessonId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "courseId", nullable = false)
    private Course course;

    @Column(name = "description")
    private String description;

    @Column(name = "lessonDuration")
    private Integer lessonDuration;


    @Column(name = "lessonTitle", nullable = false)
    private String lessonTitle;

    @Column(name = "notesFile")
    private String notesFile;

    @Column(name = "presentationFile")
    private String presentationFile;

    @Column(name = "status", nullable = false)
    private boolean status;


    @OneToMany(fetch = FetchType.LAZY, mappedBy = "lesson")
    private Set<Topics> topicses = new HashSet<Topics>(0);

    public Lesson() {
    }

    public Lesson(Course course, String lessonTitle, boolean status) {
        this.course = course;
        this.lessonTitle = lessonTitle;
        this.status = status;
    }

    public Lesson(Course course, String description, Integer lessonDuration, String lessonTitle, String notesFile, String presentationFile, boolean status, Set<Topics> topicses) {
        this.course = course;
        this.description = description;
        this.lessonDuration = lessonDuration;
        this.lessonTitle = lessonTitle;
        this.notesFile = notesFile;
        this.presentationFile = presentationFile;
        this.status = status;
        this.topicses = topicses;
    }

    public Integer getLessonId() {
        return lessonId;
    }

    public void setLessonId(Integer lessonId) {
        this.lessonId = lessonId;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getLessonDuration() {
        return lessonDuration;
    }

    public void setLessonDuration(Integer lessonDuration) {
        this.lessonDuration = lessonDuration;
    }

    public String getLessonTitle() {
        return lessonTitle;
    }

    public void setLessonTitle(String lessonTitle) {
        this.lessonTitle = lessonTitle;
    }

    public String getNotesFile() {
        return notesFile;
    }

    public void setNotesFile(String notesFile) {
        this.notesFile = notesFile;
    }

    public String getPresentationFile() {
        return presentationFile;
    }

    public void setPresentationFile(String presentationFile) {
        this.presentationFile = presentationFile;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Set<Topics> getTopicses() {
        return topicses;
    }

    public void setTopicses(Set<Topics> topicses) {
        this.topicses = topicses;
    }
}
