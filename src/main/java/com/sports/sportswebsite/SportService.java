package com.sports.sportswebsite;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class SportService {

    private static final Logger log = LoggerFactory.getLogger(SportService.class);
    private final SportRepository sportRepository;

    public SportService(SportRepository sportRepository) {
        this.sportRepository = sportRepository;
    }

    public List<Sport> getAllSports() {
        log.info("Fetching all sports");
        return sportRepository.findAll();
    }

    public Optional<Sport> getSportByUrlName(String urlName) {
        log.debug("Fetching sport by urlName: {}", urlName);
        return sportRepository.findByUrlName(urlName);
    }

    public long countSports() {
        return sportRepository.count();
    }

    public List<Sport> searchSports(String keyword) {
        log.info("Searching sports with keyword: {}", keyword);
        return sportRepository.searchByName(keyword);
    }
}