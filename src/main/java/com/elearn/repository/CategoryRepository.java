package com.elearn.repository;

import com.elearn.model.Category;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Transactional
@Repository
public interface CategoryRepository extends JpaRepository<Category,Integer> {

    Category findByCategoryId(Integer categoryId);

}
