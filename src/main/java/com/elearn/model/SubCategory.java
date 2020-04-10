package com.elearn.model;


import javax.persistence.*;


@Entity
public class SubCategory {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="subCategoryId", unique=true, nullable=false)
    private Integer subCategoryId;

    @Column(name="subCategoryName", nullable=false, length=50)
    private String subCategoryName;

    @Column(name="description")
    @Lob
    private String description;

    @Column(name="category_id", nullable=false)
    private int categoryId;

    @Column(name="status", nullable=false)
    private boolean status;

    public SubCategory() {
    }


    public SubCategory(String subCategoryName, int categoryId, boolean status) {
        this.subCategoryName = subCategoryName;
        this.categoryId = categoryId;
        this.status = status;
    }
    public SubCategory(String subCategoryName, String description, int categoryId, boolean status) {
        this.subCategoryName = subCategoryName;
        this.description = description;
        this.categoryId = categoryId;
        this.status = status;
    }

    public Integer getSubCategoryId() {
        return subCategoryId;
    }

    public void setSubCategoryId(Integer subCategoryId) {
        this.subCategoryId = subCategoryId;
    }

    public String getSubCategoryName() {
        return subCategoryName;
    }

    public void setSubCategoryName(String subCategoryName) {
        this.subCategoryName = subCategoryName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
