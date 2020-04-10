package com.elearn.serviceimp;

import com.elearn.model.SubCategory;
import com.elearn.repository.SubCategoryRepository;
import com.elearn.service.SubCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubCategoryServiceImp implements SubCategoryService {

    private SubCategoryRepository subCategoryRepository;

    @Autowired
    public SubCategoryServiceImp(SubCategoryRepository subCategoryRepository) {
        this.subCategoryRepository = subCategoryRepository;
    }

    @Override
    public boolean saveData(SubCategory obj) {

        subCategoryRepository.save(obj);

        return true;
    }

    @Override
    public List<SubCategory> getAllData() {
        return subCategoryRepository.findAll();
    }

    @Override
    public SubCategory findData(Integer subCategoryId) {
        return subCategoryRepository.findByCategoryId(subCategoryId);
    }

    @Override
    public boolean updateData(SubCategory obj) {

        subCategoryRepository.save(obj);

        return true;
    }

    @Override
    public boolean deleteData(SubCategory obj) {

        subCategoryRepository.deleteById(obj.getCategoryId());

        return true;
    }
}
