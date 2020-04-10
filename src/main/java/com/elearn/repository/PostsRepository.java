package com.elearn.repository;

import com.elearn.model.Posts;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PostsRepository extends JpaRepository<Posts,Integer> {

    Posts findByPostId(Integer postId);


}
