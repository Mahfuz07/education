package com.elearn.model;


import javax.persistence.*;

import org.hibernate.annotations.Type;

import java.util.Date;

@Entity
public class Event {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="eventId", unique=true, nullable=false)
    private Integer eventId;

    @Column(name="eventName", nullable=false, length=100)
    private String eventName;

    @Column(name="username", nullable=false, length=60)
    private String username;

    @Column(name="videoUrl", nullable=false)
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String videoUrl;

    @Column(name="notesFile")
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String notesFile;

    @Column(name="presentationFile")
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String presentationFile;

    @Column(name="eventCreatorName", nullable=false, length=100)
    private String eventCreatorName;

    @Column(name="description")
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String description;

    @Column(name="eventPhoto")
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String eventPhoto;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name="eventDate", nullable=false, length=19)
    private Date eventDate;

    @Column(name="status", nullable=false)
    private boolean status;

    public Event() {
    }


    public Event(String eventName, String username, String videoUrl, String eventCreatorName, Date eventDate, boolean status) {
        this.eventName = eventName;
        this.username = username;
        this.videoUrl = videoUrl;
        this.eventCreatorName = eventCreatorName;
        this.eventDate = eventDate;
        this.status = status;
    }
    public Event(String eventName, String username, String videoUrl, String notesFile, String presentationFile, String eventCreatorName, String description, String eventPhoto, Date eventDate, boolean status) {
        this.eventName = eventName;
        this.username = username;
        this.videoUrl = videoUrl;
        this.notesFile = notesFile;
        this.presentationFile = presentationFile;
        this.eventCreatorName = eventCreatorName;
        this.description = description;
        this.eventPhoto = eventPhoto;
        this.eventDate = eventDate;
        this.status = status;
    }

    public Integer getEventId() {
        return eventId;
    }

    public void setEventId(Integer eventId) {
        this.eventId = eventId;
    }

    public String getEventName() {
        return eventName;
    }

    public void setEventName(String eventName) {
        this.eventName = eventName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
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

    public String getEventCreatorName() {
        return eventCreatorName;
    }

    public void setEventCreatorName(String eventCreatorName) {
        this.eventCreatorName = eventCreatorName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getEventPhoto() {
        return eventPhoto;
    }

    public void setEventPhoto(String eventPhoto) {
        this.eventPhoto = eventPhoto;
    }

    public Date getEventDate() {
        return eventDate;
    }

    public void setEventDate(Date eventDate) {
        this.eventDate = eventDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
