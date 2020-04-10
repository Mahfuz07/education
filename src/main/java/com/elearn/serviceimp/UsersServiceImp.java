package com.elearn.serviceimp;

import com.elearn.model.Authorities;
import com.elearn.model.Student;
import com.elearn.model.Teacher;
import com.elearn.model.Users;
import com.elearn.repository.AuthoritiesRepository;
import com.elearn.repository.StudentRepository;
import com.elearn.repository.TeacherRepository;
import com.elearn.repository.UsersRepository;
import com.elearn.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsersServiceImp implements UserService {

    private UsersRepository usersRepository;

    private AuthoritiesRepository authoritiesRepository;

    private StudentRepository studentRepository;

    private TeacherRepository teacherRepository;

    @Autowired
    public UsersServiceImp(UsersRepository usersRepository,AuthoritiesRepository authoritiesRepository,StudentRepository studentRepository,
                           TeacherRepository teacherRepository) {
        this.usersRepository = usersRepository;
        this.authoritiesRepository = authoritiesRepository;
        this.studentRepository = studentRepository;
        this.teacherRepository = teacherRepository;
    }

    @Override
    public List<Users> getAllData() {
        return usersRepository.findAll();
    }

    @Override
    public boolean saveUserWithAuthority(Users users, Authorities authorities){

        usersRepository.save(users);
        authoritiesRepository.save(authorities);
        if(users.getUserType().equals("ROLE_STUDENT")){
            Student student  = new Student();
            student.setUsername(users.getUsername());
            studentRepository.save(student);
        }else if(users.getUserType().equals("ROLE_TEACHER")) {
            Teacher teacher = new Teacher();
            teacher.setUsername(users.getUsername());
            teacherRepository.save(teacher);
        }
        return true;
    }

    @Override
    public boolean updateUserStatus(Users users) {

        Users user = usersRepository.findByUserId(users.getUserId());
        user.setEnabled(users.isEnabled());
        usersRepository.save(user);
        return true;
    }

    @Override
    public Users findData(int id) {
        return usersRepository.findByUserId(id);
    }

    @Override
    public boolean deleteUserById(int id) {
        usersRepository.deleteById(id);
        return true;
    }

    @Override
    public boolean updateData(Users obj, Authorities authorities) {
        Users user = usersRepository.findByUserId(obj.getUserId());

        user.setUsername(obj.getUsername());
        user.setAuthority(obj.getAuthority());
        usersRepository.save(user);
        authoritiesRepository.save(authorities);

        return true;
    }

    @Override
    public boolean saveData(Users obj) {

        usersRepository.save(obj);
        return true;
    }

    @Override
    public Users getUserByUserName(String username) {
        return usersRepository.findByUsername(username);
    }

    @Override
    public List<Users> getAllStudentUsers() {

        return  usersRepository.findAllByUserType("ROLE_STUDENT");
    }

    @Override
    public List<Users> getAllTeacherUsers() {
        return usersRepository.findAllByUserType("ROLE_TEACHER");
    }

    @Override
    public boolean updateData(Users obj) {
        usersRepository.save(obj);

        return true;
    }

    @Override
    public boolean deleteData(Users obj) {
        usersRepository.deleteById(obj.getUserId());
        return true;
    }


}
