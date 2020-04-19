package com.elearn.serviceimp;

import com.elearn.model.UserRole;
import com.elearn.repository.UserRoleRepository;
import com.elearn.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserRoleServiceImp implements UserRoleService {

    private UserRoleRepository userRoleRepository;

    @Autowired
    public UserRoleServiceImp(UserRoleRepository userRoleRepository) {
        this.userRoleRepository = userRoleRepository;
    }

    @Override
    public boolean saveData(UserRole obj) {
         userRoleRepository.save(obj);
        return true;
    }

    @Override
    public List<UserRole> getAllUserRole() {
        return userRoleRepository.findAll();
    }

    @Override
    public boolean deleteRoleById(int id) {
        userRoleRepository.deleteById(id);
        return true;
    }
}