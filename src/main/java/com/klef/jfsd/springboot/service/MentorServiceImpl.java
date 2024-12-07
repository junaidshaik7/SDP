package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.repository.MentorRepository;


@Service
public class MentorServiceImpl implements MentorService 
{

    @Autowired
    private MentorRepository mentorRepository;
	

    @Override
    public String mentorRegistration(Mentor mentor) {
        mentorRepository.save(mentor);
        return "Mentor Registered Successfully";
    }

    @Override
    public Mentor checkMentorLogin(String email, String password) {
        return mentorRepository.findByEmailAndPassword(email, password);
    }

    @Override
    public String updateMentorProfile(Mentor mentor) {
        mentorRepository.save(mentor);
        return "Mentor profile updated successfully";
    }

    @Override
    public Mentor displayMentorById(int mentorId) {
        return mentorRepository.findById(mentorId).orElse(null);
    }

    @Override
    public List<Mentor> getAllMentors() {
        return mentorRepository.findAll();
    }

    @Override
    public String assignProjectToStudent(int mentorId, int studentId, int projectId) {
        // Logic to assign project to a student
        return "Project assigned successfully to student.";
    }
    
}

