package com.sports.sportswebsite;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.util.Arrays;
import java.util.List;

@Controller
public class HomeController {

    @GetMapping("/")
    public String index(Model model) {

        // Fake data - sports history facts
        List<String> sports = Arrays.asList(
                "Football", "Basketball", "Tennis", "Olympics"
        );

        List<String> facts = Arrays.asList(
                "Football is the most popular sport in the world with over 4 billion fans.",
                "Basketball was invented in 1891 by Dr. James Naismith in Massachusetts.",
                "Tennis has been played since the 12th century in France.",
                "The first modern Olympic Games were held in Athens, Greece in 1896."
        );

        model.addAttribute("sports", sports);
        model.addAttribute("facts", facts);
        model.addAttribute("title", "Sports History Website");

        return "index";
    }
}