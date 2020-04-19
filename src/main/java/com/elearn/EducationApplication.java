package com.elearn;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.elearn.model.UserRole;
import com.elearn.repository.UserRoleRepository;

@SpringBootApplication
public class EducationApplication {
	
	@Autowired
	private UserRoleRepository repository;

	public static void main(String[] args) {
		SpringApplication.run(EducationApplication.class, args);
	}
	
	
	
	public void run(String... args) throws Exception {
		
		
		UserRole role1 = new UserRole();
		UserRole role2 = new UserRole();
		role1.setRoleId(1);
		role1.setRoleName("ROLE_ADMIN");
		repository.save(role1);
		role2.setRoleId(2);

		role2.setRoleName("ROLE_TEACHER");
		repository.save(role2);
		
	}

}
