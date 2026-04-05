package com.sports.sportswebsite;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Sport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
    private String fact;
    private String emoji;
    @Column(name = "url_name")
    private String urlName;
    private String fact1;
    private String fact2;
    private String fact3;
    private String fact4;
    private String fact5;
    @Column(name = "image_url")
    private String imageUrl;
    @Column(name = "athlete_image_url")
    private String athleteImageUrl;
    @Column(name = "athlete_name")
    private String athleteName;

    public Sport() {}

    public Long getId() { return id; }
    public String getName() { return name; }
    public String getDescription() { return description; }
    public String getFact() { return fact; }
    public String getEmoji() { return emoji; }
    public String getUrlName() { return urlName; }
    public String getFact1() { return fact1; }
    public String getFact2() { return fact2; }
    public String getFact3() { return fact3; }
    public String getFact4() { return fact4; }
    public String getFact5() { return fact5; }
    public String getImageUrl() { return imageUrl; }
    public String getAthleteImageUrl() { return athleteImageUrl; }
    public String getAthleteName() { return athleteName; }
}