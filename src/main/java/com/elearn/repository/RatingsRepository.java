package com.elearn.repository;

import com.elearn.model.Ratings;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RatingsRepository extends JpaRepository<Ratings,Integer> {

    public List<Ratings> findAllByPostId(int postId);

}
