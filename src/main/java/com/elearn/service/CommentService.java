package com.elearn.service;


import com.elearn.model.Comments;

import java.util.List;

public interface CommentService {

    public boolean saveData(Comments obj);

    public List<Comments> getAllCommentsByTopicsId(int id);

}
