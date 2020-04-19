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
	
	
	

}
