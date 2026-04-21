package com.sports.sportswebsite;

import jakarta.persistence.*;
import java.util.List;
import java.util.List;

@Entity
public class Sport {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @Column(length = 1000)
    private String description;
    @Column(length = 1000)
    private String fact;
    private String emoji;
    @Column(name = "url_name")
    private String urlName;
    @Column(length = 1000)
    private String fact1;
    @Column(length = 1000)
    private String fact2;
    @Column(length = 1000)
    private String fact3;
    @Column(length = 1000)
    private String fact4;
    @Column(length = 1000)
    private String fact5;
    @Column(length = 1000)
    private String fact6;
    @Column(length = 1000)
    private String fact7;
    @Column(length = 1000)
    private String fact8;
    @Column(length = 1000)
    private String fact9;
    @Column(length = 1000)
    private String fact10;
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
    public String getFact6() { return fact6; }
    public String getFact7() { return fact7; }
    public String getFact8() { return fact8; }
    public String getFact9() { return fact9; }
    public String getFact10() { return fact10; }
    public String getImageUrl() { return imageUrl; }
    public String getAthleteImageUrl() { return athleteImageUrl; }
    public String getAthleteName() { return athleteName; }
    @OneToMany(mappedBy = "sportEntity", fetch = FetchType.LAZY)
    private List<Athlete> athletes;

    public List<Athlete> getAthletes() { return athletes; }
    public void setName(String name) { this.name = name; }
    public void setDescription(String description) { this.description = description; }
    public void setEmoji(String emoji) { this.emoji = emoji; }
    public void setUrlName(String urlName) { this.urlName = urlName; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }
    public void setFact(String fact) { this.fact = fact; }
    public void setFact1(String fact1) { this.fact1 = fact1; }
    public void setFact2(String fact2) { this.fact2 = fact2; }
    public void setFact3(String fact3) { this.fact3 = fact3; }
    public void setFact4(String fact4) { this.fact4 = fact4; }
    public void setFact5(String fact5) { this.fact5 = fact5; }
}