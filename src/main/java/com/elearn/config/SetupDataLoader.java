package com.elearn.config;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

import com.elearn.model.UserRole;
import com.elearn.repository.UserRoleRepository;

@Component
public class SetupDataLoader implements ApplicationListener<ContextRefreshedEvent> {


    private boolean alreadySetup = false;

    @Autowired
    private UserRoleRepository userRoleRepository;

    @Override
    @Transactional
    public void onApplicationEvent(ContextRefreshedEvent event) {

        if (alreadySetup) {
            return;
        }

        createRoleIfNotFound("ROLE_ADMIN");
        createRoleIfNotFound("ROLE_STUDENT");
        createRoleIfNotFound("ROLE_TEACHER");

        alreadySetup = true;
    }



    @Transactional
    private final UserRole createRoleIfNotFound(final String name) {
        UserRole role = userRoleRepository.findByRoleName(name);
        if (role == null) {
            role = new UserRole(name);
        }

        role = userRoleRepository.save(role);
        return role;
    }



}

