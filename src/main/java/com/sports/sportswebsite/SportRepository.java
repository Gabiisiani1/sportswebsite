package com.sports.sportswebsite;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import java.util.List;
import java.util.Optional;

public interface SportRepository extends JpaRepository<Sport, Long> {
    Optional<Sport> findByUrlName(String urlName);

    @Query("SELECT s FROM Sport s WHERE " +
            "LOWER(s.name) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(s.fact1) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(s.fact2) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(s.fact3) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(s.fact4) LIKE LOWER(CONCAT('%', :keyword, '%')) OR " +
            "LOWER(s.fact5) LIKE LOWER(CONCAT('%', :keyword, '%'))")
    List<Sport> searchByName(@Param("keyword") String keyword);
}