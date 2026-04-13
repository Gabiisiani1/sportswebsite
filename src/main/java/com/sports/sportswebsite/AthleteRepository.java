package com.sports.sportswebsite;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;

public interface AthleteRepository extends JpaRepository<Athlete, Long> {
    List<Athlete> findBySport(String sport);
    Page<Athlete> findBySport(String sport, Pageable pageable);
    List<Athlete> findByGeorgianTrue();
    Page<Athlete> findAll(Pageable pageable);

    @Query("SELECT a FROM Athlete a WHERE " +
            "LOWER(a.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(a.info) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(a.achievement) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(a.nationality) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<Athlete> searchAthletes(@Param("keyword") String keyword);
    List<Athlete> findByGeorgianTrueOrderBySportAsc();
}