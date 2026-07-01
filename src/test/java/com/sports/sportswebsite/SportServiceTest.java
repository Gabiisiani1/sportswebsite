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
class SportServiceTest {

    @Mock
    private SportRepository sportRepository;

    @InjectMocks
    private SportService sportService;

    private Sport football;
    private Sport basketball;

    @BeforeEach
    void setUp() {
        football = new Sport();
        football.setName("Football");
        football.setUrlName("football");
        football.setDescription("The world's most popular sport");

        basketball = new Sport();
        basketball.setName("Basketball");
        basketball.setUrlName("basketball");
        basketball.setDescription("Born in 1891");
    }

    @Test
    void getAllSports_shouldReturnAllSports() {
        when(sportRepository.findAll()).thenReturn(Arrays.asList(football, basketball));
        List<Sport> result = sportService.getAllSports();
        assertEquals(2, result.size());
        assertEquals("Football", result.get(0).getName());
        verify(sportRepository, times(1)).findAll();
    }

    @Test
    void getSportByUrlName_shouldReturnSport_whenExists() {
        when(sportRepository.findByUrlName("football")).thenReturn(Optional.of(football));
        Optional<Sport> result = sportService.getSportByUrlName("football");
        assertTrue(result.isPresent());
        assertEquals("Football", result.get().getName());
    }

    @Test
    void getSportByUrlName_shouldReturnEmpty_whenNotExists() {
        when(sportRepository.findByUrlName("unknown")).thenReturn(Optional.empty());
        Optional<Sport> result = sportService.getSportByUrlName("unknown");
        assertFalse(result.isPresent());
    }

    @Test
    void countSports_shouldReturnCorrectCount() {
        when(sportRepository.count()).thenReturn(9L);
        long count = sportService.countSports();
        assertEquals(9L, count);
    }
}