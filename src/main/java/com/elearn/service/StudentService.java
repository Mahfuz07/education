package com.elearn.service;

import com.elearn.model.Student;

import java.util.List;

public interface StudentService {

    public Student getStudentByUserName(String username);

    public boolean deleteStudentByUsername(String username);

    public boolean updateData(Student obj);

    public List<Student> getAllData();

}
