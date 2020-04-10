package com.elearn.model;


import javax.persistence.*;

@Entity
public class EventsComments {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column( unique = true, nullable = false)
    private Integer eventsCommentsId;

    @Column( nullable = false, length = 60)
    private String username;

    @Column( nullable = false)
    private int eventId;

    @Column( nullable = false)
    @Lob
    private String comment;

    public EventsComments() {
    }

    public EventsComments(String username, int eventId, String comment) {
        this.username = username;
        this.eventId = eventId;
        this.comment = comment;
    }

    public Integer getEventsCommentsId() {
        return eventsCommentsId;
    }

    public void setEventsCommentsId(Integer eventsCommentsId) {
        this.eventsCommentsId = eventsCommentsId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
