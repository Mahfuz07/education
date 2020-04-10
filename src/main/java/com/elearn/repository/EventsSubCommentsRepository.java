package com.elearn.repository;

import com.elearn.model.EventsSubComments;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EventsSubCommentsRepository extends JpaRepository<EventsSubComments,Integer> {


}
