package com.elearn.serviceimp;

import com.elearn.model.Ratings;
import com.elearn.repository.RatingsRepository;
import com.elearn.service.RatingsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RatingsServiceImp implements RatingsService {

    private RatingsRepository ratingsRepository;

    @Autowired
    public RatingsServiceImp(RatingsRepository ratingsRepository) {
        this.ratingsRepository = ratingsRepository;
    }


    public List<Ratings> findRatingsByBlogPostId(int postId){
        return ratingsRepository.findAllByPostId(postId);
    }

    @Override
    public Ratings saveData(Ratings obj) {
        return ratingsRepository.save(obj);
    }


}
