package com.elearn.model;


import javax.persistence.*;

import org.hibernate.annotations.Type;

@Entity
public class EventsSubComments {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column( unique = true, nullable = false)
    private Integer eventsSubCommentsId;

    @Column( nullable = false)
    private int eventsCommentsId;

    @Column( nullable = false)
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String subComments;

    @Column( nullable = false, length = 60)
    private String username;

    public EventsSubComments() {
    }

    public EventsSubComments(int eventsSubCommentsId, String subComments, String username) {
        this.eventsSubCommentsId = eventsSubCommentsId;
        this.subComments = subComments;
        this.username = username;
    }

    public Integer getEventsSubCommentsId() {
        return eventsSubCommentsId;
    }

    public void setEventsSubCommentsId(Integer eventsSubCommentsId) {
        this.eventsSubCommentsId = eventsSubCommentsId;
    }

    public int getEventsCommentsId() {
        return eventsCommentsId;
    }

    public void setEventsCommentsId(int eventsCommentsId) {
        this.eventsCommentsId = eventsCommentsId;
    }

    public String getSubComments() {
        return subComments;
    }

    public void setSubComments(String subComments) {
        this.subComments = subComments;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
