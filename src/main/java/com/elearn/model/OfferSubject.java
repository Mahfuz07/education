package com.elearn.model;


import javax.persistence.*;
import java.util.Date;

@Entity
public class OfferSubject {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "osId", unique = true, nullable = false)
    private Integer osId;

    @Column(name = "courseId", nullable = false)
    private int courseId;

    @Column(name = "batchId", nullable = false)
    private int batchId;

    @Column(name = "teacherId", nullable = false)
    private int teacherId;

    @Temporal(TemporalType.DATE)
    @Column(name = "startDate", nullable = false, length = 10)
    private Date startDate;

    @Temporal(TemporalType.DATE)
    @Column(name = "endDate", nullable = false, length = 10)
    private Date endDate;

    @Column(name = "hours", nullable = false)
    private int hours;

    public OfferSubject() {
    }

    public OfferSubject(int courseId, int batchId, int teacherId, Date startDate, Date endDate, int hours) {
        this.courseId = courseId;
        this.batchId = batchId;
        this.teacherId = teacherId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.hours = hours;
    }

    public Integer getOsId() {
        return osId;
    }

    public void setOsId(Integer osId) {
        this.osId = osId;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public int getBatchId() {
        return batchId;
    }

    public void setBatchId(int batchId) {
        this.batchId = batchId;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getHours() {
        return hours;
    }

    public void setHours(int hours) {
        this.hours = hours;
    }
}
