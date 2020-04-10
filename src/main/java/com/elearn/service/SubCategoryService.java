package com.elearn.service;

import com.elearn.model.SubCategory;

import java.util.List;

public interface SubCategoryService {

    public boolean saveData(SubCategory obj);

    public List<SubCategory> getAllData();

    public SubCategory findData(Integer subCategoryId);

    public boolean updateData(SubCategory obj);

    public boolean deleteData(SubCategory obj);
}
