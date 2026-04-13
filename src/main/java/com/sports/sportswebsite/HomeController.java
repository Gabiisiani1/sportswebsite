package com.sports.sportswebsite;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    private final SportRepository sportRepository;
    private final AthleteRepository athleteRepository;

    public HomeController(SportRepository sportRepository, AthleteRepository athleteRepository) {
        this.sportRepository = sportRepository;
        this.athleteRepository = athleteRepository;
    }

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("title", "Sports History Website");
        model.addAttribute("sports", sportRepository.findAll());
        model.addAttribute("sportCount", sportRepository.count());
        model.addAttribute("athleteCount", athleteRepository.count());
        return "index";
    }

    @GetMapping("/sport/{urlName}")
    public String sport(@PathVariable String urlName, Model model) {
        Sport sport = sportRepository.findByUrlName(urlName)
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
        if (keyword != null && !keyword.isEmpty()) {
            model.addAttribute("results", sportRepository.searchByName(keyword));
            model.addAttribute("athleteResults", athleteRepository.searchAthletes(keyword));
        } else {
            model.addAttribute("results", sportRepository.findAll());
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
        model.addAttribute("georgianAthletes", athleteRepository.findByGeorgianTrue());
        model.addAttribute("footballCount", athleteRepository.findBySport("Football").size());
        model.addAttribute("basketballCount", athleteRepository.findBySport("Basketball").size());
        model.addAttribute("formula1Count", athleteRepository.findBySport("Formula 1").size());
        model.addAttribute("tennisCount", athleteRepository.findBySport("Tennis").size());
        model.addAttribute("nflCount", athleteRepository.findBySport("NFL").size());
        model.addAttribute("mmaCount", athleteRepository.findBySport("MMA & UFC").size());
        model.addAttribute("rugbyCount", athleteRepository.findBySport("Rugby").size());
        model.addAttribute("olympicsCount", athleteRepository.findBySport("Olympics").size());
        model.addAttribute("worldcupCount", athleteRepository.findBySport("World Cup 2026").size());
        return "athletes";
    }


    @GetMapping("/georgian-athletes")
    public String georgianAthletes(Model model) {
        model.addAttribute("title", "Georgian Athletes");
        model.addAttribute("georgianAthletes", athleteRepository.findByGeorgianTrueOrderBySportAsc());
        return "georgian-athletes";
    }
}