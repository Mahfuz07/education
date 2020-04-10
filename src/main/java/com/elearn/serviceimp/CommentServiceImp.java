package com.elearn.serviceimp;

import com.elearn.model.Comments;
import com.elearn.repository.CommentsRepository;
import com.elearn.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CommentServiceImp implements CommentService {

    private CommentsRepository commentsRepository;

    @Autowired
    public CommentServiceImp(CommentsRepository commentsRepository) {
        this.commentsRepository = commentsRepository;
    }

    @Override
    public boolean saveData(Comments obj) {

        commentsRepository.save(obj);
        return true;
    }

    @Override
    public List<Comments> getAllCommentsByTopicsId(int id) {

        List<Comments> comments = commentsRepository.findAllByTopicsId(id);

        List<Comments> comments1 = new ArrayList<>();

        for(Comments  comments2:comments){
            Comments comments3 = new Comments();
            comments3.setCommentsId(comments2.getCommentsId());
            comments3.setUsername(comments2.getUsername());
            comments3.setComment(comments2.getComment());
            comments1.add(comments3);
        }


        return comments1;
    }


}
