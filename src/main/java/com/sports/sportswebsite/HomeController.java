package com.sports.sportswebsite;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    private static final Logger log = LoggerFactory.getLogger(HomeController.class);

    private final SportService sportService;
    private final AthleteService athleteService;
    private final AthleteRepository athleteRepository;

    public HomeController(SportService sportService, AthleteService athleteService, AthleteRepository athleteRepository) {
        this.sportService = sportService;
        this.athleteService = athleteService;
        this.athleteRepository = athleteRepository;
    }

    @GetMapping("/")
    public String index(Model model) {
        log.info("Home page accessed - loading {} sports", sportService.countSports());
        model.addAttribute("title", "Sports History Website");
        model.addAttribute("sports", sportService.getAllSports());
        model.addAttribute("sportCount", sportService.countSports());
        model.addAttribute("athleteCount", athleteService.countAthletes());
        return "index";
    }

    @GetMapping("/sport/{urlName}")
    public String sport(@PathVariable String urlName, Model model) {
        log.debug("Sport page accessed: {}", urlName);
        Sport sport = sportService.getSportByUrlName(urlName)
                .orElseThrow(() -> new RuntimeException("Sport not found"));
        model.addAttribute("sport", sport);
        model.addAttribute("title", sport.getName());
        return "sport";
    }

    @GetMapping("/football")
    public String football(Model model) {
        return "redirect:/sport/football";
    }

    @GetMapping("/basketball")
    public String basketball(Model model) {
        return "redirect:/sport/basketball";
    }

    @GetMapping("/formula1")
    public String formula1(Model model) {
        return "redirect:/sport/formula1";
    }

    @GetMapping("/about")
    public String about(Model model) {
        model.addAttribute("title", "About");
        return "about";
    }

    @GetMapping("/search")
    public String search(@RequestParam(required = false) String keyword, Model model) {
        log.info("Search performed with keyword: {}", keyword);
        if (keyword != null && !keyword.isEmpty()) {
            model.addAttribute("results", sportService.searchSports(keyword));
            model.addAttribute("athleteResults", athleteService.searchAthletes(keyword));
        } else {
            model.addAttribute("results", sportService.getAllSports());
            model.addAttribute("athleteResults", java.util.Collections.emptyList());
        }
        model.addAttribute("keyword", keyword);
        model.addAttribute("title", "Search Sports");
        return "search";
    }

    @GetMapping("/athletes")
    public String athletes(Model model,
                           @RequestParam(defaultValue = "0") int page,
                           @RequestParam(required = false) String sport) {
        log.debug("Athletes page accessed - page: {}, sport filter: {}", page, sport);
        int pageSize = 9;
        org.springframework.data.domain.Pageable pageable =
                org.springframework.data.domain.PageRequest.of(page, pageSize,
                        org.springframework.data.domain.Sort.by("id").ascending());
        org.springframework.data.domain.Page<Athlete> athletePage;

        if (sport != null && !sport.isEmpty()) {
            athletePage = athleteRepository.findBySport(sport, pageable);
            model.addAttribute("selectedSport", sport);
            model.addAttribute("selectedSportEncoded", sport.replace("&", "%26"));
        } else {
            athletePage = athleteRepository.findAll(pageable);
        }

        model.addAttribute("title", "Athletes");
        model.addAttribute("athletes", athletePage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", athletePage.getTotalPages());
        model.addAttribute("georgianAthletes", athleteService.getGeorgianAthletes());
        model.addAttribute("footballCount", athleteService.getAthletesBySport("Football").size());
        model.addAttribute("basketballCount", athleteService.getAthletesBySport("Basketball").size());
        model.addAttribute("formula1Count", athleteService.getAthletesBySport("Formula 1").size());
        model.addAttribute("tennisCount", athleteService.getAthletesBySport("Tennis").size());
        model.addAttribute("nflCount", athleteService.getAthletesBySport("NFL").size());
        model.addAttribute("mmaCount", athleteService.getAthletesBySport("MMA & UFC").size());
        model.addAttribute("rugbyCount", athleteService.getAthletesBySport("Rugby").size());
        model.addAttribute("olympicsCount", athleteService.getAthletesBySport("Olympics").size());
        model.addAttribute("worldcupCount", athleteService.getAthletesBySport("World Cup 2026").size());
        return "athletes";
    }

    @GetMapping("/georgian-athletes")
    public String georgianAthletes(Model model) {
        log.info("Georgian athletes page accessed");
        model.addAttribute("title", "Georgian Athletes");
        model.addAttribute("georgianAthletes", athleteRepository.findByGeorgianTrueOrderBySportAsc());
        return "georgian-athletes";
    }
}