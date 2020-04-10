package com.elearn.repository;

import com.elearn.model.SubCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubCategoryRepository extends JpaRepository<SubCategory,Integer> {


    SubCategory findByCategoryId(Integer subCategoryId);

}
