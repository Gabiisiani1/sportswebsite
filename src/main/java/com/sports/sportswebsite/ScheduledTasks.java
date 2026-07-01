package com.sports.sportswebsite;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Component
public class ScheduledTasks {

    private static final Logger log = LoggerFactory.getLogger(ScheduledTasks.class);

    private final SportService sportService;
    private final AthleteService athleteService;

    public ScheduledTasks(SportService sportService, AthleteService athleteService) {
        this.sportService = sportService;
        this.athleteService = athleteService;
    }

    @Scheduled(fixedRate = 300000)
    public void logStats() {
        String time = LocalDateTime.now().format(DateTimeFormatter.ofPattern("HH:mm:ss"));
        log.info("=== Scheduled Stats Report [{}] === Sports: {} | Athletes: {}",
                time, sportService.countSports(), athleteService.countAthletes());
    }

    @Scheduled(cron = "0 0 * * * *")
    public void clearCache() {
        log.info("Hourly cache clear triggered");
        sportService.clearSportsCache();
    }
}