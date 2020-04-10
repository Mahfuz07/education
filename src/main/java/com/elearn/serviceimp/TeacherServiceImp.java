package com.elearn.serviceimp;

import com.elearn.model.Teacher;
import com.elearn.repository.TeacherRepository;
import com.elearn.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImp implements TeacherService {

    private TeacherRepository teacherRepository;

    @Autowired
    public TeacherServiceImp(TeacherRepository teacherRepository) {
        this.teacherRepository = teacherRepository;
    }

    @Override
    public Teacher getTeacherByUsername(String username) {
        return teacherRepository.findByUsername(username);
    }

    @Override
    public boolean deleteTeacherByUsername(String username) {
         teacherRepository.deleteById(username);
        return true;
    }

    @Override
    public Teacher updateData(Teacher obj) {
        return teacherRepository.save(obj);
    }

    @Override
    public List<Teacher> getAllData() {
        return teacherRepository.findAll();
    }
}
