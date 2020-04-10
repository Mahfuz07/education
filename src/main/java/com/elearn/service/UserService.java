package com.elearn.service;

import com.elearn.model.Authorities;
import com.elearn.model.Users;

import java.util.List;

public interface UserService {

    public List<Users> getAllData();

    public boolean saveUserWithAuthority(Users users, Authorities authorities);

    public boolean updateUserStatus(Users users);

    public Users findData(int id);

    public boolean deleteUserById(int id);

    public boolean updateData(Users obj, Authorities authorities);

    public boolean saveData(Users obj);

    public Users getUserByUserName(String username);

    public List<Users> getAllStudentUsers();

    public List<Users> getAllTeacherUsers();

    public boolean updateData(Users obj);

    public boolean deleteData(Users obj);

}
