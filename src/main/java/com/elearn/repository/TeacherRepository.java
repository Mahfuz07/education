package com.elearn.repository;

import com.elearn.model.Teacher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TeacherRepository extends JpaRepository<Teacher,String> {

    Teacher findByUsername(String username);
}
