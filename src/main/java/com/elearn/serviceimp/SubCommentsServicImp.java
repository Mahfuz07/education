package com.elearn.serviceimp;

import com.elearn.model.Subcomments;
import com.elearn.repository.SubCommentsRepository;
import com.elearn.service.SubCommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SubCommentsServicImp implements SubCommentsService {

    private SubCommentsRepository subCommentsRepository;

    @Autowired
    public SubCommentsServicImp(SubCommentsRepository subCommentsRepository) {
        this.subCommentsRepository = subCommentsRepository;
    }

    @Override
    public List<Subcomments> getAllData() {
        return subCommentsRepository.findAll();
    }

    @Override
    public boolean saveData(Subcomments obj) {
        subCommentsRepository.save(obj);
        return true;
    }
}
