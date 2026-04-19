package com.sports.sportswebsite;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@RequestMapping("/api")
public class SportsApiController {

    private static final Logger log = LoggerFactory.getLogger(SportsApiController.class);

    private final SportService sportService;
    private final AthleteService athleteService;

    public SportsApiController(SportService sportService, AthleteService athleteService) {
        this.sportService = sportService;
        this.athleteService = athleteService;
    }

    @GetMapping("/sports")
    public List<Sport> getAllSports() {
        log.info("API: Getting all sports");
        return sportService.getAllSports();
    }

    @GetMapping("/sports/{urlName}")
    public ResponseEntity<Sport> getSport(@PathVariable String urlName) {
        log.info("API: Getting sport by urlName: {}", urlName);
        return sportService.getSportByUrlName(urlName)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @GetMapping("/athletes")
    public List<Athlete> getAllAthletes() {
        log.info("API: Getting all athletes");
        return athleteService.getAllAthletes();
    }

    @GetMapping("/athletes/georgian")
    public List<Athlete> getGeorgianAthletes() {
        log.info("API: Getting Georgian athletes");
        return athleteService.getGeorgianAthletes();
    }

    @GetMapping("/athletes/sport/{sport}")
    public List<Athlete> getAthletesBySport(@PathVariable String sport) {
        log.info("API: Getting athletes for sport: {}", sport);
        return athleteService.getAthletesBySport(sport);
    }

    @DeleteMapping("/athletes/{id}")
    public ResponseEntity<Void> deleteAthlete(@PathVariable Long id) {
        log.warn("API: Deleting athlete with id: {}", id);
        athleteService.deleteAthlete(id);
        return ResponseEntity.ok().build();
    }
}