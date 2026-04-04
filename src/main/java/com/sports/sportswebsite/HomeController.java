package com.sports.sportswebsite;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class HomeController {

    private final SportRepository sportRepository;

    public HomeController(SportRepository sportRepository) {
        this.sportRepository = sportRepository;
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
}