package com.sports.sportswebsite;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface AthleteRepository extends JpaRepository<Athlete, Long> {
    List<Athlete> findBySport(String sport);
    List<Athlete> findByGeorgianTrue();
}