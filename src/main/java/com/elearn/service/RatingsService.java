package com.elearn.service;

import com.elearn.model.Ratings;

import java.util.List;

public interface RatingsService {

    public List<Ratings> findRatingsByBlogPostId(int postId);

    public Ratings saveData(Ratings obj);

}
