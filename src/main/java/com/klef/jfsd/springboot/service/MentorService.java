package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Mentor;

public interface MentorService {
    String mentorRegistration(Mentor mentor);
    Mentor checkMentorLogin(String email, String password);
    String updateMentorProfile(Mentor mentor);
    Mentor displayMentorById(int mentorId);
    List<Mentor> getAllMentors();
    String assignProjectToStudent(int mentorId, int studentId, int projectId);
}
