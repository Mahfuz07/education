package com.elearn.serviceimp;

import com.elearn.model.Category;
import com.elearn.repository.CategoryRepository;
import com.elearn.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class CategoryServiceImp implements CategoryService {


    private CategoryRepository categoryRepository;

    @Autowired
    public CategoryServiceImp(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public List<Category> getAllData() {
        return categoryRepository.findAll();
    }

    @Override
    public boolean saveData(Category obj) {

        categoryRepository.save(obj);

        return true;
    }

    @Override
    public Category findData(Integer categoryId) {
        return categoryRepository.findByCategoryId(categoryId);
    }

    @Override
    public boolean updateData(Category obj) {

        categoryRepository.save(obj);

        return true;
    }

    @Override
    public boolean deleteData(Category obj) {

        categoryRepository.deleteById(obj.getCategoryId());

        return true;
    }
}
