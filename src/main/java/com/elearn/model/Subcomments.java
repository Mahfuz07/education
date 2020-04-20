package com.elearn.model;


import javax.persistence.*;

import org.hibernate.annotations.Type;

@Entity
public class Subcomments {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "subCommentsId", unique = true, nullable = false)
    private Integer subCommentsId;

    @Column(name = "commentsId", nullable = false)
    private int commentsId;

    @Column(name = "subComments", nullable = false)
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String subComments;

    @Column(name = "username", nullable = false, length = 60)
    private String username;

    public Subcomments() {
    }

    public Subcomments(int commentsId, String subComments, String username) {
        this.commentsId = commentsId;
        this.subComments = subComments;
        this.username = username;
    }

    public Integer getSubCommentsId() {
        return subCommentsId;
    }

    public void setSubCommentsId(Integer subCommentsId) {
        this.subCommentsId = subCommentsId;
    }

    public int getCommentsId() {
        return commentsId;
    }

    public void setCommentsId(int commentsId) {
        this.commentsId = commentsId;
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
