package com.sports.sportswebsite;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface AthleteRepository extends JpaRepository<Athlete, Long> {
    List<Athlete> findBySport(String sport);
    List<Athlete> findByGeorgianTrue();

    @Query("SELECT a FROM Athlete a WHERE " +
            "LOWER(a.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(a.info) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(a.achievement) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(a.nationality) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<Athlete> searchAthletes(@Param("keyword") String keyword);
}