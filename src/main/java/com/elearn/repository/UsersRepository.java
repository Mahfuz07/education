package com.elearn.repository;

import com.elearn.model.Users;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UsersRepository extends JpaRepository<Users,Integer> {

    Users findByUserId(Integer userId);

    Users findByUsername(String username);

    List<Users> findAllByUserType(String userType);

    Users findByEmail(String email);
}
