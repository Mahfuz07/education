package com.elearn.serviceimp;

import com.elearn.model.Student;
import com.elearn.repository.StudentRepository;
import com.elearn.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImp implements StudentService {


    private StudentRepository studentRepository;

    @Autowired
    public StudentServiceImp(StudentRepository studentRepository){

        this.studentRepository = studentRepository;

    }

    @Override
    public Student getStudentByUserName(String username) {
        return studentRepository.findByUsername(username);
    }

    @Override
    public boolean deleteStudentByUsername(String username) {
        studentRepository.deleteById(username);
        return true;
    }

    @Override
    public boolean updateData(Student obj) {

        studentRepository.save(obj);
        return true;
    }

    @Override
    public List<Student> getAllData() {
        return studentRepository.findAll();
    }


}
