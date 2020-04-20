package com.elearn.model;


import javax.persistence.*;

import org.hibernate.annotations.Type;

import java.util.Date;


@Entity
public class Posts {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "postId", unique = true, nullable = false)
    private Integer postId;

    @Column(name = "postTitle", nullable = false, length = 200)
    private String postTitle;

    @Column(name = "postSubTitle", length = 45)
    private String postSubTitle;

    @Column(name = "postContent", nullable = false)
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String postContent;

    @Column(name = "postShorten", nullable = false)
    private int postShorten;

    @Column(name = "subCategoryId", nullable = false, length = 50)
    private String subCategoryId;

    @Column(name = "authorName", nullable = false, length = 45)
    private String authorName;

    @Column(name = "status", nullable = false)
    private boolean status;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "postDate", nullable = false, length = 19)
    private Date postDate;

    @Column(name = "image")
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String image;

    @Column(name = "views", nullable = false)
    private int views;

    public Posts() {
    }

    public Posts(String postTitle, String postContent, int postShorten, String subCategoryId, String authorName, boolean status, Date postDate, int views) {
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.postShorten = postShorten;
        this.subCategoryId = subCategoryId;
        this.authorName = authorName;
        this.status = status;
        this.postDate = postDate;
        this.views = views;
    }

    public Posts(String postTitle, String postSubTitle, String postContent, int postShorten, String subCategoryId, String authorName, boolean status, Date postDate, String image, int views) {
        this.postTitle = postTitle;
        this.postSubTitle = postSubTitle;
        this.postContent = postContent;
        this.postShorten = postShorten;
        this.subCategoryId = subCategoryId;
        this.authorName = authorName;
        this.status = status;
        this.postDate = postDate;
        this.image = image;
        this.views = views;
    }

    public Integer getPostId() {
        return postId;
    }

    public void setPostId(Integer postId) {
        this.postId = postId;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostSubTitle() {
        return postSubTitle;
    }

    public void setPostSubTitle(String postSubTitle) {
        this.postSubTitle = postSubTitle;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public int getPostShorten() {
        return postShorten;
    }

    public void setPostShorten(int postShorten) {
        this.postShorten = postShorten;
    }

    public String getSubCategoryId() {
        return subCategoryId;
    }

    public void setSubCategoryId(String subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }
}
