package com.sports.sportswebsite;

import jakarta.validation.Valid;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private static final Logger log = LoggerFactory.getLogger(AdminController.class);
    private final AthleteService athleteService;
    private final SportService sportService;

    public AdminController(AthleteService athleteService, SportService sportService) {
        this.athleteService = athleteService;
        this.sportService = sportService;
    }

    @GetMapping
    public String adminHome(Model model) {
        log.info("Admin page accessed");
        model.addAttribute("title", "Admin Panel");
        model.addAttribute("athleteCount", athleteService.countAthletes());
        model.addAttribute("sportCount", sportService.countSports());
        model.addAttribute("athletes", athleteService.getAllAthletes());
        model.addAttribute("newAthlete", new Athlete());
        return "admin";
    }

    @PostMapping("/athletes/add")
    public String addAthlete(@Valid @ModelAttribute("newAthlete") Athlete athlete,
                             BindingResult bindingResult,
                             @RequestParam("imageFile") MultipartFile imageFile,
                             @RequestParam(value = "georgian", required = false, defaultValue = "false") boolean georgian,
                             @RequestParam(value = "retired", required = false, defaultValue = "false") boolean retired,
                             RedirectAttributes redirectAttributes,
                             Model model) {
        athlete.setGeorgian(georgian);
        athlete.setRetired(retired);

        if (bindingResult.hasErrors()) {
            log.warn("Validation errors when adding athlete: {}", bindingResult.getAllErrors());
            model.addAttribute("errors", bindingResult.getAllErrors());
            model.addAttribute("title", "Admin Panel");
            model.addAttribute("athleteCount", athleteService.countAthletes());
            model.addAttribute("sportCount", sportService.countSports());
            model.addAttribute("athletes", athleteService.getAllAthletes());
            return "admin";
        }

        if (!imageFile.isEmpty()) {
            try {
                String uploadDir = "src/main/resources/static/images/";
                Path uploadPath = Paths.get(uploadDir);
                if (!Files.exists(uploadPath)) {
                    Files.createDirectories(uploadPath);
                }
                String filename = imageFile.getOriginalFilename();
                Path filePath = uploadPath.resolve(filename);
                Files.copy(imageFile.getInputStream(), filePath);
                log.info("Image uploaded: {}", filename);
            } catch (IOException e) {
                log.error("Failed to upload image: {}", e.getMessage());
            }
        }

        athleteService.saveAthlete(athlete);
        log.info("New athlete added: {}", athlete.getName());
        redirectAttributes.addFlashAttribute("successMessage", "Athlete " + athlete.getName() + " added successfully!");
        return "redirect:/admin";
    }

    @PostMapping("/athletes/delete/{id}")
    public String deleteAthlete(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        log.warn("Deleting athlete with id: {}", id);
        athleteService.deleteAthlete(id);
        redirectAttributes.addFlashAttribute("successMessage", "Athlete deleted successfully!");
        return "redirect:/admin";
    }

    @GetMapping("/athletes/edit/{id}")
    public String editAthletePage(@PathVariable Long id, Model model) {
        Athlete athlete = athleteService.getAthleteById(id)
                .orElseThrow(() -> new RuntimeException("Athlete not found"));
        model.addAttribute("athlete", athlete);
        model.addAttribute("title", "Edit Athlete");
        return "admin-edit";
    }

    @PostMapping("/athletes/edit/{id}")
    public String editAthlete(@PathVariable Long id,
                              @Valid @ModelAttribute("athlete") Athlete athlete,
                              BindingResult bindingResult,
                              @RequestParam(value = "georgian", required = false, defaultValue = "false") boolean georgian,
                              @RequestParam(value = "retired", required = false, defaultValue = "false") boolean retired,
                              RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            log.warn("Validation errors when editing athlete");
            return "admin-edit";
        }
        athlete.setId(id);
        athlete.setGeorgian(georgian);
        athlete.setRetired(retired);
        athleteService.saveAthlete(athlete);
        log.info("Athlete updated: {}", athlete.getName());
        redirectAttributes.addFlashAttribute("successMessage", "Athlete updated successfully!");
        return "redirect:/admin";
    }
}