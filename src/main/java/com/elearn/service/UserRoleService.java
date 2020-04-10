package com.elearn.service;

import com.elearn.model.UserRole;

import java.util.List;

public interface UserRoleService {

    public boolean saveData(UserRole obj);

    public List<UserRole> getAllUserRole();

    public boolean deleteRoleById(int id);


}
