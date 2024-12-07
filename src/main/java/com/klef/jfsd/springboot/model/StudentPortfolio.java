package com.klef.jfsd.springboot.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="std_portfolio")
public class StudentPortfolio 
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String studentName;
    private String email;
    private String bio;
    private String phoneNumber;
    private String profileImageUrl;
    private String projectDetails; // Store project details as JSON or comma-separated string
    private String skills; // Store skills as comma-separated string
    private String socialLinks; // Store social links as JSON or comma-separated string
    private String achievements; // Store achievements as JSON or comma-separated string

    // Getters and Setters
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getStudentName() {
        return studentName;
    }
    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getBio() {
        return bio;
    }
    public void setBio(String bio) {
        this.bio = bio;
    }
    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    public String getProfileImageUrl() {
        return profileImageUrl;
    }
    public void setProfileImageUrl(String profileImageUrl) {
        this.profileImageUrl = profileImageUrl;
    }
    public String getProjectDetails() {
        return projectDetails;
    }
    public void setProjectDetails(String projectDetails) {
        this.projectDetails = projectDetails;
    }
    public String getSkills() {
        return skills;
    }
    public void setSkills(String skills) {
        this.skills = skills;
    }
    public String getSocialLinks() {
        return socialLinks;
    }
    public void setSocialLinks(String socialLinks) {
        this.socialLinks = socialLinks;
    }
    public String getAchievements() {
        return achievements;
    }
    public void setAchievements(String achievements) {
        this.achievements = achievements;
    }
}
