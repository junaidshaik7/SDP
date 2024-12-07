package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentAchievements;
import com.klef.jfsd.springboot.model.StudentArticles;
import com.klef.jfsd.springboot.model.StudentPerks;
import com.klef.jfsd.springboot.model.StudentPortfolio;
import com.klef.jfsd.springboot.model.StudentProject;
import com.klef.jfsd.springboot.model.StudentSeminar;

public interface StudentService 
{
	public String StudentRegistration(Student std);
	public Student checkstdlogin(String email, String pwd);
    public String updateStudentProfile(Student student);
    public Student displayStudentbyID(int sid);
    public String saveProject(StudentProject project);
    public String StudentAchievements(StudentAchievements stdach);
    public List<StudentAchievements> ViewAllAchievements();
    List<StudentProject> getAllProjectsByStudentId();
    List<StudentPerks> getAllPerks();
    StudentSeminar addStudentSeminar(StudentSeminar studentSeminar);
    List<StudentSeminar> getAllSeminars();
    public String saveArticle(StudentArticles articles);
    public List<StudentArticles> ViewAllArticles();
    
   
    StudentPortfolio addPortfolio(StudentPortfolio portfolio);
    List<StudentPortfolio> getAllPortfolios();
    StudentPortfolio getPortfolioById(Long id);
    void updatePortfolio(StudentPortfolio portfolio);
    void deletePortfolio(Long id);
    

    
    
    

}
