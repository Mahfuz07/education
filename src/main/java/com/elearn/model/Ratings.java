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

    @Column(name = "postId")
    private Integer postId;

    @Column(name = "topicsId")
    private Integer topicsId;

    @Column(name = "eventId")
    private Integer eventId;

    @Column(name = "username", nullable = false, length = 45)
    private String username;

    public Ratings() {
    }

    public Ratings(String username) {
        this.username = username;
    }

    public Ratings(Integer rating, Integer postId, Integer topicsId, Integer eventId, String username) {
        this.rating = rating;
        this.postId = postId;
        this.topicsId = topicsId;
        this.eventId = eventId;
        this.username = username;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
