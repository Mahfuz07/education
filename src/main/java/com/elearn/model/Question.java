package com.elearn.model;


import javax.persistence.*;

@Entity
public class Question {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "questionId", unique = true, nullable = false)
    private Integer questionId;

    @Column(name = "question", nullable = false)
    @Lob
    private String questionType;

    @Column(name = "aOne", nullable = false)
    @Lob
    private String aone;

    @Column(name = "aTwo", nullable = false)
    @Lob
    private String atwo;

    @Column(name = "aThree", nullable = false)
    @Lob
    private String athree;

    @Column(name = "aFour", nullable = false)
    @Lob
    private String afour;

    @Column(name = "cAnswer", nullable = false, length = 45)
    private String canswer;

    @Column(name = "lessonId")
    private Integer lessonId;

    @Column(name = "eventId")
    private Integer eventId;

    @Column(name = "userName", length = 60)
    private String userName;

    @Column(name = "status", nullable = false)
    private boolean status;

    public Question() {
    }

    public Question(String questionType, String aone, String atwo, String athree, String afour, String canswer, boolean status) {
        this.questionType = questionType;
        this.aone = aone;
        this.atwo = atwo;
        this.athree = athree;
        this.afour = afour;
        this.canswer = canswer;
        this.status = status;
    }

    public Question(String questionType, String aone, String atwo, String athree, String afour, String canswer, Integer lessonId, Integer eventId, String userName, boolean status) {
        this.questionType = questionType;
        this.aone = aone;
        this.atwo = atwo;
        this.athree = athree;
        this.afour = afour;
        this.canswer = canswer;
        this.lessonId = lessonId;
        this.eventId = eventId;
        this.userName = userName;
        this.status = status;
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public String getQuestionType() {
        return questionType;
    }

    public void setQuestionType(String questionType) {
        this.questionType = questionType;
    }

    public String getAone() {
        return aone;
    }

    public void setAone(String aone) {
        this.aone = aone;
    }

    public String getAtwo() {
        return atwo;
    }

    public void setAtwo(String atwo) {
        this.atwo = atwo;
    }

    public String getAthree() {
        return athree;
    }

    public void setAthree(String athree) {
        this.athree = athree;
    }

    public String getAfour() {
        return afour;
    }

    public void setAfour(String afour) {
        this.afour = afour;
    }

    public String getCanswer() {
        return canswer;
    }

    public void setCanswer(String canswer) {
        this.canswer = canswer;
    }

    public Integer getLessonId() {
        return lessonId;
    }

    public void setLessonId(Integer lessonId) {
        this.lessonId = lessonId;
    }

    public Integer getEventId() {
        return eventId;
    }

    public void setEventId(Integer eventId) {
        this.eventId = eventId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
