package com.sports.sportswebsite;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
public class Athlete {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Name is required")
    @Size(min = 2, max = 100, message = "Name must be between 2 and 100 characters")
    private String name;

    @NotBlank(message = "Sport is required")
    private String sport;

    @NotBlank(message = "Nationality is required")
    private String nationality;

    @Column(length = 1000)
    @NotBlank(message = "Info is required")
    @Size(min = 10, message = "Info must be at least 10 characters")
    private String info;

    @Column(length = 500)
    private String achievement;
    private boolean georgian;

    @Column(columnDefinition = "boolean default false")
    private boolean retired;

    public Athlete() {}

    public Long getId() { return id; }
    public String getName() { return name; }
    public String getSport() { return sport; }
    public String getNationality() { return nationality; }
    public String getInfo() { return info; }
    public String getAchievement() { return achievement; }
    public boolean isGeorgian() { return georgian; }
    public boolean isRetired() { return retired; }
    public void setName(String name) { this.name = name; }
    public void setSport(String sport) { this.sport = sport; }
    public void setNationality(String nationality) { this.nationality = nationality; }
    public void setInfo(String info) { this.info = info; }
    public void setAchievement(String achievement) { this.achievement = achievement; }
    public void setGeorgian(boolean georgian) { this.georgian = georgian; }
    public void setRetired(boolean retired) { this.retired = retired; }
    public void setId(Long id) { this.id = id; }
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "sport_entity_id")
    private Sport sportEntity;

    public Sport getSportEntity() { return sportEntity; }
    public void setSportEntity(Sport sportEntity) { this.sportEntity = sportEntity; }

}