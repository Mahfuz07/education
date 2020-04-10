package com.elearn.model;


import javax.persistence.*;

@Entity
public class Comments {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "commentsId", unique = true, nullable = false)
    private Integer commentsId;

    @Column(name = "username", nullable = false, length = 60)
    private String username;

    @Column(name = "topicsId", nullable = false)
    private int topicsId;

    @Column(name = "comment", nullable = false)
    @Lob
    private String comment;

    public Comments() {
    }

    public Comments(String username, int topicsId, String comment) {
        this.username = username;
        this.topicsId = topicsId;
        this.comment = comment;
    }

    public Integer getCommentsId() {
        return commentsId;
    }

    public void setCommentsId(Integer commentsId) {
        this.commentsId = commentsId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getTopicsId() {
        return topicsId;
    }

    public void setTopicsId(int topicsId) {
        this.topicsId = topicsId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
