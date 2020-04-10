package com.elearn.model;


import org.hibernate.validator.constraints.Length;

import javax.persistence.*;


@Entity
public class Category {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "categoryId")
    private Integer categoryId;

    @Column(name = "categoryName",nullable = false)
    @Length(min = 2,max = 45)
    private String categoryName;

    @Column(name = "description")
    @Lob
    @Length(min=2,max = 65535)
    private String description;

    @Column(name = "status")
    private boolean status;

    public Category() {
    }

    public Category(String categoryName, boolean status) {
        this.categoryName = categoryName;
        this.status = status;
    }

    public Category(String categoryName, String description, boolean status) {
        this.categoryName = categoryName;
        this.description = description;
        this.status = status;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
