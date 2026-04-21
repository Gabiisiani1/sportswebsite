package com.sports.sportswebsite;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class AthleteService {

    private static final Logger log = LoggerFactory.getLogger(AthleteService.class);
    private final AthleteRepository athleteRepository;

    public AthleteService(AthleteRepository athleteRepository) {
        this.athleteRepository = athleteRepository;
    }

    public List<Athlete> getAllAthletes() {
        log.info("Fetching all athletes");
        return athleteRepository.findAll();
    }

    public Optional<Athlete> getAthleteById(Long id) {
        return athleteRepository.findById(id);
    }

    public List<Athlete> getGeorgianAthletes() {
        log.info("Fetching Georgian athletes");
        return athleteRepository.findByGeorgianTrue();
    }

    public List<Athlete> getAthletesBySport(String sport) {
        log.debug("Fetching athletes for sport: {}", sport);
        return athleteRepository.findBySport(sport);
    }

    public long countAthletes() {
        return athleteRepository.count();
    }

    public List<Athlete> searchAthletes(String keyword) {
        log.info("Searching athletes with keyword: {}", keyword);
        return athleteRepository.searchAthletes(keyword);
    }

    public void deleteAthlete(Long id) {
        log.warn("Deleting athlete with id: {}", id);
        athleteRepository.deleteById(id);
    }

    public Athlete saveAthlete(Athlete athlete) {
        log.info("Saving athlete: {}", athlete.getName());
        return athleteRepository.save(athlete);
    }
}