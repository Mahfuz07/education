package com.elearn.serviceimp;

import com.elearn.model.Posts;
import com.elearn.repository.PostsRepository;
import com.elearn.service.PostsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostsServiceImp implements PostsService {

    private PostsRepository postsRepository;

    @Autowired
    public PostsServiceImp(PostsRepository postsRepository) {
        this.postsRepository = postsRepository;
    }

    @Override
    public Posts findData(Integer postId) {
        return postsRepository.findByPostId(postId);
    }

    @Override
    public boolean updateData(Posts obj) {
        postsRepository.save(obj);
        return true;
    }

    @Override
    public boolean saveData(Posts obj) {

        postsRepository.save(obj);
        return true;
    }

    @Override
    public List<Posts> getAllData() {
        return postsRepository.findAll();
    }

    @Override
    public boolean deleteData(Posts obj) {
        postsRepository.deleteById(obj.getPostId());

        return true;
    }


}
