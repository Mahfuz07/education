package com.elearn.repository;

import com.elearn.model.Subcomments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SubCommentsRepository extends JpaRepository<Subcomments,Integer> {
}
