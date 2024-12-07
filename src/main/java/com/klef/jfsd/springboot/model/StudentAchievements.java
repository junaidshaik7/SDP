package com.klef.jfsd.springboot.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="student_achievements")
public class StudentAchievements {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // or GenerationType.AUTO
    private Long id; // Unique identifier

   
    private String achievementName;
    private String achievementDescription;
    private String dateAchieved;

    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAchievementName() {
        return achievementName;
    }

    public void setAchievementName(String achievementName) {
        this.achievementName = achievementName;
    }

    public String getDateAchieved() {
        return dateAchieved;
    }

    public void setDateAchieved(String dateAchieved) {
        this.dateAchieved = dateAchieved;
    }

	public String getAchievementDescription() {
		return achievementDescription;
	}

	public void setAchievementDescription(String achievementDescription) {
		this.achievementDescription = achievementDescription;
	}
}
