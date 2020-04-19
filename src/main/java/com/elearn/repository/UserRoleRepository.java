package com.elearn.repository;

import com.elearn.model.UserRole;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRoleRepository extends JpaRepository<UserRole,Integer> {
	
	UserRole findByRoleName(String name);
	
}
