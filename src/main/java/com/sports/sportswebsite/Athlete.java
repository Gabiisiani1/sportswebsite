package com.sports.sportswebsite;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Athlete {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String sport;
    private String nationality;
    @Column(length = 1000)
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
}