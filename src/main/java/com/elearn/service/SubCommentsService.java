package com.elearn.service;

import com.elearn.model.Subcomments;

import java.util.List;

public interface SubCommentsService {

    public List<Subcomments> getAllData();

    public boolean saveData(Subcomments obj);

}
