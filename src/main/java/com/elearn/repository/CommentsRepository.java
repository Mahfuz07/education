package com.elearn.repository;

import com.elearn.model.Comments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentsRepository extends JpaRepository<Comments,Integer> {

        List<Comments> findAllByTopicsId(int id);

}
