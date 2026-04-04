package com.sports.sportswebsite;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.Arrays;
import java.util.List;

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

    @GetMapping("/football")
    public String football(Model model) {
        model.addAttribute("title", "Football History");
        model.addAttribute("description", "Football is the world's most popular sport, played in over 200 countries.");
        model.addAttribute("facts", Arrays.asList(
                "The first official football match was played in 1872 between Scotland and England.",
                "FIFA was founded in Paris in 1904.",
                "The FIFA World Cup started in 1930 in Uruguay.",
                "Brazil has won the World Cup a record 5 times.",
                "Pelé is considered the greatest footballer of all time."
        ));
        return "football";
    }

    @GetMapping("/basketball")
    public String basketball(Model model) {
        model.addAttribute("title", "Basketball History");
        model.addAttribute("description", "Basketball is one of the most watched sports in the world, born in the USA.");
        model.addAttribute("facts", Arrays.asList(
                "Basketball was invented in December 1891 by Dr. James Naismith.",
                "The NBA was founded in 1946 as the BAA.",
                "Michael Jordan is widely considered the greatest basketball player ever.",
                "The Boston Celtics have won the most NBA Championships with 17 titles.",
                "Basketball became an Olympic sport in 1936 at the Berlin Games."
        ));
        return "basketball";
    }

    @GetMapping("/formula1")
    public String formula1(Model model) {
        model.addAttribute("title", "Formula 1 History");
        model.addAttribute("description", "Formula 1 is the pinnacle of motorsport, combining speed, technology and skill.");
        model.addAttribute("facts", Arrays.asList(
                "The first Formula 1 World Championship race was held in 1950 at Silverstone.",
                "Michael Schumacher won 7 World Championships, matched by Lewis Hamilton.",
                "Ferrari is the oldest and most successful team in Formula 1 history.",
                "The Monaco Grand Prix is the most prestigious race in Formula 1.",
                "F1 cars can reach speeds of over 370 km/h."
        ));
        return "formula1";
    }
}