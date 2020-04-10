package com.elearn.service;

import com.elearn.model.Posts;

import java.util.List;

public interface PostsService {

    public Posts findData(Integer postId);

    public boolean updateData(Posts obj);

    public boolean saveData(Posts obj);

    public List<Posts> getAllData();

    public boolean deleteData(Posts obj);

}
