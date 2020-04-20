package com.elearn.model;


import javax.persistence.*;

import org.hibernate.annotations.Type;

import java.util.Date;


@Entity
public class LessonExamResult {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "resultId", unique = true, nullable = false)
    private Integer resultId;

    @Column(name = "username", nullable = false, length = 60)
    private String username;

    @Column(name = "lessonId", nullable = false)
    private int lessonId;

    @Column(name = "lessonName", nullable = false)
    @Lob
    @Type(type = "org.hibernate.type.TextType")
    private String lessonName;

    @Column(name = "totalQuestion", nullable = false)
    private int totalQuestion;

    @Column(name = "passMark", nullable = false)
    private int passMark;

    @Column(name = "correctAnswer", nullable = false)
    private int correctAnswer;

    @Column(name = "wrongAnswer", nullable = false)
    private int wrongAnswer;

    @Column(name = "passingStatus", nullable = false, length = 40)
    private String passingStatus;

    @Temporal(TemporalType.DATE)
    @Column(name = "examDate", nullable = false, length = 10)
    private Date examDate;

    public LessonExamResult() {
    }

    public LessonExamResult(String username, int lessonId, String lessonName, int totalQuestion, int passMark, int correctAnswer, int wrongAnswer, String passingStatus, Date examDate) {
        this.username = username;
        this.lessonId = lessonId;
        this.lessonName = lessonName;
        this.totalQuestion = totalQuestion;
        this.passMark = passMark;
        this.correctAnswer = correctAnswer;
        this.wrongAnswer = wrongAnswer;
        this.passingStatus = passingStatus;
        this.examDate = examDate;
    }

    public Integer getResultId() {
        return resultId;
    }

    public void setResultId(Integer resultId) {
        this.resultId = resultId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getLessonId() {
        return lessonId;
    }

    public void setLessonId(int lessonId) {
        this.lessonId = lessonId;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public int getTotalQuestion() {
        return totalQuestion;
    }

    public void setTotalQuestion(int totalQuestion) {
        this.totalQuestion = totalQuestion;
    }

    public int getPassMark() {
        return passMark;
    }

    public void setPassMark(int passMark) {
        this.passMark = passMark;
    }

    public int getCorrectAnswer() {
        return correctAnswer;
    }

    public void setCorrectAnswer(int correctAnswer) {
        this.correctAnswer = correctAnswer;
    }

    public int getWrongAnswer() {
        return wrongAnswer;
    }

    public void setWrongAnswer(int wrongAnswer) {
        this.wrongAnswer = wrongAnswer;
    }

    public String getPassingStatus() {
        return passingStatus;
    }

    public void setPassingStatus(String passingStatus) {
        this.passingStatus = passingStatus;
    }

    public Date getExamDate() {
        return examDate;
    }

    public void setExamDate(Date examDate) {
        this.examDate = examDate;
    }
}
