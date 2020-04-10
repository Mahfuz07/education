package com.elearn.service;

import com.elearn.model.Teacher;

import java.util.List;

public interface TeacherService {

    public Teacher getTeacherByUsername(String username);

    public boolean deleteTeacherByUsername(String username);

    public Teacher updateData(Teacher obj);

    public List<Teacher> getAllData();
}
