package com.elearn.repository;


import com.elearn.model.EventsComments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EventCommentsRepository extends JpaRepository<EventsComments,Integer> {

    List<EventsComments> findAllByEventId(int id);
}
