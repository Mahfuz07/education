package com.elearn.model;

import javax.persistence.*;


@Entity
public class Topics{


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "topicsId", unique = true, nullable = false)
    private Integer topicsId;

    @ManyToOne(targetEntity = Lesson.class,fetch = FetchType.LAZY)
    @JoinColumn(name = "lessonId", nullable = false)
    private Lesson lesson;

    @Column(name = "description")
    private String description;

    @Column(name = "duration", nullable = false)
    private int duration;

    @Column(name = "status")
    private Boolean status;

    @Column(name = "topicsTitle", nullable = false)
    private String topicsTitle;

    @Column(name = "videoUrl")
    private String videoUrl;

    public Topics() {
    }

    public Topics(Lesson lesson, int duration, String topicsTitle) {
        this.lesson = lesson;
        this.duration = duration;
        this.topicsTitle = topicsTitle;
    }

    public Topics(Lesson lesson, String description, int duration, Boolean status, String topicsTitle, String videoUrl) {
        this.lesson = lesson;
        this.description = description;
        this.duration = duration;
        this.status = status;
        this.topicsTitle = topicsTitle;
        this.videoUrl = videoUrl;
    }

    public Integer getTopicsId() {
        return topicsId;
    }

    public void setTopicsId(Integer topicsId) {
        this.topicsId = topicsId;
    }

    public Lesson getLesson() {
        return lesson;
    }

    public void setLesson(Lesson lesson) {
        this.lesson = lesson;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public String getTopicsTitle() {
        return topicsTitle;
    }

    public void setTopicsTitle(String topicsTitle) {
        this.topicsTitle = topicsTitle;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }
}
