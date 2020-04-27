package com.elearn.model;


import javax.persistence.*;


@Entity
public class Ratings {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ratingId", unique = true, nullable = false)
    private Integer ratingId;

    @Column(name = "rating")
    private Integer rating;

    @Column(name = "content")
    private String content;

    @Column(name = "postId")
    private Integer postId;

    @Column(name = "topicsId")
    private Integer topicsId;

    @Column(name = "eventId")
    private Integer eventId;

    @ManyToOne(targetEntity = Users.class,fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private Users users;

    public Ratings() {
    }

    public Ratings(Users users) {
        this.users = users;
    }

    public Ratings(Integer ratingId, Integer rating, String content, Integer postId, Integer topicsId, Integer eventId) {
        this.ratingId = ratingId;
        this.rating = rating;
        this.content = content;
        this.postId = postId;
        this.topicsId = topicsId;
        this.eventId = eventId;
    }

    public Integer getRatingId() {
        return ratingId;
    }

    public void setRatingId(Integer ratingId) {
        this.ratingId = ratingId;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public Integer getTopicsId() {
        return topicsId;
    }

    public void setTopicsId(Integer topicsId) {
        this.topicsId = topicsId;
    }

    public Integer getEventId() {
        return eventId;
    }

    public void setEventId(Integer eventId) {
        this.eventId = eventId;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
