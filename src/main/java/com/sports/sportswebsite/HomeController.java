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
        } else {
            model.addAttribute("results", sportRepository.findAll());
        }
        model.addAttribute("keyword", keyword);
        model.addAttribute("title", "Search Sports");
        return "search";
    }

    @GetMapping("/athletes")
    public String athletes(Model model) {
        model.addAttribute("title", "Athletes");
        model.addAttribute("georgianAthletes", athleteRepository.findByGeorgianTrue());
        model.addAttribute("footballAthletes", athleteRepository.findBySport("Football"));
        model.addAttribute("basketballAthletes", athleteRepository.findBySport("Basketball"));
        model.addAttribute("formula1Athletes", athleteRepository.findBySport("Formula 1"));
        model.addAttribute("tennisAthletes", athleteRepository.findBySport("Tennis"));
        model.addAttribute("nflAthletes", athleteRepository.findBySport("NFL"));
        model.addAttribute("mmaAthletes", athleteRepository.findBySport("MMA & UFC"));
        model.addAttribute("rugbyAthletes", athleteRepository.findBySport("Rugby"));
        model.addAttribute("olympicsAthletes", athleteRepository.findBySport("Olympics"));
        model.addAttribute("worldcupAthletes", athleteRepository.findBySport("World Cup 2026"));
        return "athletes";
    }
}