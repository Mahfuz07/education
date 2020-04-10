package com.elearn.service;


import com.elearn.model.Category;

import java.util.List;

public interface CategoryService {

    public List<Category> getAllData();

    public boolean saveData(Category obj);

    public Category findData(Integer categoryId);

    public boolean updateData(Category obj);

    public boolean deleteData(Category obj);

}
