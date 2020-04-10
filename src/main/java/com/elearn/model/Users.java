package com.elearn.model;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Date;


@Entity
public class Users{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "userId", unique = true, nullable = false)
    private Integer userId;

    @Column(name = "authority", nullable = false, length = 40)
    private String authority;

    @Temporal(TemporalType.DATE)
    @Column(name = "dob", length = 10)
    private Date dob;

    @Column(name = "email", nullable = false, unique = true, length = 100)
    private String email;

    @Column(name = "enabled", nullable = false)
    private boolean enabled;

    @Column(name = "firstName", length = 50)
    private String firstName;

    @Column(name = "gender")
    private Boolean gender;

    @Column(name = "lastName", length = 50)
    private String lastName;

    @Column(name = "mobile", length = 11)
    private String mobile;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "photo", length = 225)
    private String photo;

    @Temporal(TemporalType.DATE)
    @Column(name = "registerDate", nullable = false, length = 10)
    private Date registerDate;


    @Size(min = 1, max = 45, message = "User Name must be between 1 to 45 character")
    @Column(name = "username", nullable = false, unique = true, length = 60)
    private String username;

    @Column(name = "userType", length = 45)
    private String userType;


    public Users() {
    }

    public Users(String authority, String email, boolean enabled, String password, Date registerDate, String username) {
        this.authority = authority;
        this.email = email;
        this.enabled = enabled;
        this.password = password;
        this.registerDate = registerDate;
        this.username = username;
    }

    public Users(String authority, Date dob, String email, boolean enabled, String firstName, Boolean gender, String lastName, String mobile, String password, String photo, Date registerDate, String username, String userType) {
        this.authority = authority;
        this.dob = dob;
        this.email = email;
        this.enabled = enabled;
        this.firstName = firstName;
        this.gender = gender;
        this.lastName = lastName;
        this.mobile = mobile;
        this.password = password;
        this.photo = photo;
        this.registerDate = registerDate;
        this.username = username;
        this.userType = userType;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
}
