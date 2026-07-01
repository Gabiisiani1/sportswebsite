package com.sports.sportswebsite;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;
import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class AthleteServiceTest {

    @Mock
    private AthleteRepository athleteRepository;

    @InjectMocks
    private AthleteService athleteService;

    private Athlete kvara;
    private Athlete topuria;

    @BeforeEach
    void setUp() {
        kvara = new Athlete();
        kvara.setName("Khvicha Kvaratskhelia");
        kvara.setSport("Football");
        kvara.setNationality("Georgian");
        kvara.setInfo("Georgia's greatest footballer");
        kvara.setGeorgian(true);

        topuria = new Athlete();
        topuria.setName("Ilia Topuria");
        topuria.setSport("MMA & UFC");
        topuria.setNationality("Georgian");
        topuria.setInfo("UFC Champion from Georgia");
        topuria.setGeorgian(true);
    }

    @Test
    void getAllAthletes_shouldReturnAllAthletes() {
        when(athleteRepository.findAll()).thenReturn(Arrays.asList(kvara, topuria));
        List<Athlete> result = athleteService.getAllAthletes();
        assertEquals(2, result.size());
        verify(athleteRepository, times(1)).findAll();
    }

    @Test
    void getGeorgianAthletes_shouldReturnOnlyGeorgians() {
        when(athleteRepository.findByGeorgianTrue()).thenReturn(Arrays.asList(kvara, topuria));
        List<Athlete> result = athleteService.getGeorgianAthletes();
        assertEquals(2, result.size());
        assertTrue(result.stream().allMatch(Athlete::isGeorgian));
    }

    @Test
    void getAthletesBySport_shouldReturnAthletesForSport() {
        when(athleteRepository.findBySport("Football")).thenReturn(Arrays.asList(kvara));
        List<Athlete> result = athleteService.getAthletesBySport("Football");
        assertEquals(1, result.size());
        assertEquals("Football", result.get(0).getSport());
    }

    @Test
    void countAthletes_shouldReturnCorrectCount() {
        when(athleteRepository.count()).thenReturn(190L);
        long count = athleteService.countAthletes();
        assertEquals(190L, count);
    }

    @Test
    void saveAthlete_shouldSaveAndReturnAthlete() {
        when(athleteRepository.save(kvara)).thenReturn(kvara);
        Athlete result = athleteService.saveAthlete(kvara);
        assertEquals("Khvicha Kvaratskhelia", result.getName());
        verify(athleteRepository, times(1)).save(kvara);
    }

    @Test
    void deleteAthlete_shouldCallRepository() {
        doNothing().when(athleteRepository).deleteById(1L);
        athleteService.deleteAthlete(1L);
        verify(athleteRepository, times(1)).deleteById(1L);
    }

    @Test
    void getAthleteById_shouldReturnAthlete_whenExists() {
        when(athleteRepository.findById(1L)).thenReturn(Optional.of(kvara));
        Optional<Athlete> result = athleteService.getAthleteById(1L);
        assertTrue(result.isPresent());
        assertEquals("Khvicha Kvaratskhelia", result.get().getName());
    }
}