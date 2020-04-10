package com.elearn.repository;

import com.elearn.model.Event;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EventRepository extends JpaRepository<Event,Integer> {

    Event findByEventId(Integer eventId);

}
