package com.elearn.model;



import javax.persistence.*;

import org.hibernate.annotations.Type;

@Entity
public class Student {


//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "studentId", unique = true, nullable = false)
//    private Integer studentId;
    @Id
    @Column(name = "username", unique = true, nullable = false, length = 60)
    private String username;

    @Column(name = "fatherName", length = 60)
    private String fatherName;

    @Column(name = "motherName", length = 60)
    private String motherName;

    @Column(name = "presentAddress")
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String presentAddress;

    @Column(name = "permanentAddress")
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String permanentAddress;

    @Column(name = "religion", length = 45)
    private String religion;

    @Column(name = "nationality", length = 45)
    private String nationality;

    @Column(name = "fatherMobile", length = 11)
    private String fatherMobile;

    @Column(name = "motherMobile", length = 11)
    private String motherMobile;

    @Column(name = "homeMobile", length = 11)
    private String homeMobile;

    public Student() {
    }

    public Student(String username) {
        this.username = username;
    }

    public Student(String username, String fatherName, String motherName, String presentAddress, String permanentAddress, String religion, String nationality, String fatherMobile, String motherMobile, String homeMobile) {
        this.username = username;
        this.fatherName = fatherName;
        this.motherName = motherName;
        this.presentAddress = presentAddress;
        this.permanentAddress = permanentAddress;
        this.religion = religion;
        this.nationality = nationality;
        this.fatherMobile = fatherMobile;
        this.motherMobile = motherMobile;
        this.homeMobile = homeMobile;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFatherName() {
        return fatherName;
    }

    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getMotherName() {
        return motherName;
    }

    public void setMotherName(String motherName) {
        this.motherName = motherName;
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

    public String getReligion() {
        return religion;
    }

    public void setReligion(String religion) {
        this.religion = religion;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getFatherMobile() {
        return fatherMobile;
    }

    public void setFatherMobile(String fatherMobile) {
        this.fatherMobile = fatherMobile;
    }

    public String getMotherMobile() {
        return motherMobile;
    }

    public void setMotherMobile(String motherMobile) {
        this.motherMobile = motherMobile;
    }

    public String getHomeMobile() {
        return homeMobile;
    }

    public void setHomeMobile(String homeMobile) {
        this.homeMobile = homeMobile;
    }
}
