package com.elearn.model;



import javax.persistence.*;

import org.hibernate.annotations.Type;

import java.util.Date;

@Entity
public class Teacher  {


//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "teacherId", unique = true, nullable = false)
//    private Integer teacherId;

    @Id
    @Column(name = "username", unique = true, nullable = false, length = 60)
    private String username;

    @Column(name = "designation", length = 100)
    private String designation;

    @Temporal(TemporalType.DATE)
    @Column(name = "joinDate", length = 10)
    private Date joinDate;

    @Column(name = "presentAddress")
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String presentAddress;

    @Column(name = "permanentAddress")
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String permanentAddress;

    @Column(name = "details")
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String details;

    public Teacher() {
    }

    public Teacher(String username) {
        this.username = username;
    }

    public Teacher(String username, String designation, Date joinDate, String presentAddress, String permanentAddress, String details) {
        this.username = username;
        this.designation = designation;
        this.joinDate = joinDate;
        this.presentAddress = presentAddress;
        this.permanentAddress = permanentAddress;
        this.details = details;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public Date getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(Date joinDate) {
        this.joinDate = joinDate;
    }

    public String getPresentAddress() {
        return presentAddress;
    }

    public void setPresentAddress(String presentAddress) {
        this.presentAddress = presentAddress;
    }

    public String getPermanentAddress() {
        return permanentAddress;
    }

    public void setPermanentAddress(String permanentAddress) {
        this.permanentAddress = permanentAddress;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }
}
