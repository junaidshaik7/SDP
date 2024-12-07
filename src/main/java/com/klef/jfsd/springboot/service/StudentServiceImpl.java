package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentAchievements;
import com.klef.jfsd.springboot.model.StudentArticles;
import com.klef.jfsd.springboot.model.StudentPerks;
import com.klef.jfsd.springboot.model.StudentPortfolio;
import com.klef.jfsd.springboot.model.StudentProject;
import com.klef.jfsd.springboot.model.StudentSeminar;
import com.klef.jfsd.springboot.repository.AchievementRepository;
import com.klef.jfsd.springboot.repository.ArticleRepository;
import com.klef.jfsd.springboot.repository.ProjectRepository;
import com.klef.jfsd.springboot.repository.StudentPortfolioRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;
import com.klef.jfsd.springboot.repository.StudentSeminarRepository;
import com.klef.jfsd.springboot.repository.StudentsPerksRepository;

@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private ProjectRepository projectRepository;
	
	@Autowired
	private AchievementRepository achievementRepository;
	
	@Autowired
	private StudentsPerksRepository studentsPerksRepository;
	
	@Autowired
	private StudentSeminarRepository studentSeminarRepository;
	
	@Autowired
	private ArticleRepository articleRepository;
	
	@Autowired
	private StudentPortfolioRepository repository;
	 
	
	@Override
	public String StudentRegistration(Student std)
	{
		studentRepository.save(std);
		return "Student Registered Successfully";
		
	}

	@Override
	public Student checkstdlogin(String email, String pwd) 
	{
		return studentRepository.checkstdlogin(email, pwd);
		
	}

	@Override
	public String updateStudentProfile(Student student) 
	{
      Student s = studentRepository.findById(student.getId()).get();
        
        s.setFirstname(student.getFirstname());
        s.setLastname(student.getLastname());
        s.setDateofbirth(student.getDateofbirth());
        s.setDepartment(student.getDepartment());
        s.setLocation(student.getLocation());
        s.setContact(student.getContact());
	    
	   studentRepository.save(s);
	    
	    return "Student Updated Successfully";
		
	}

	@Override
	public Student displayStudentbyID(int sid) 
	{
		return studentRepository.findById(sid).get();
		
	}

	@Override
	public String saveProject(StudentProject project) 
	{
		projectRepository.save(project);
		return "Project Saved Successfully";
		
	}

	

	@Override
	public String StudentAchievements(StudentAchievements stdach) 
	{
		achievementRepository.save(stdach);
		return "Student Achievements Added Successfully";
		
	}

	@Override
	public List<StudentAchievements> ViewAllAchievements()
	{
		return achievementRepository.findAll();
	}

	@Override
	public List<StudentProject> getAllProjectsByStudentId() 
	{
	    return projectRepository.findAll();
	}

	@Override
	public List<StudentPerks> getAllPerks() 
	{
		   return studentsPerksRepository.findAll();
		
	}

	@Override
	public StudentSeminar addStudentSeminar(StudentSeminar studentSeminar) 
	{
		return studentSeminarRepository.save(studentSeminar);
	}

	@Override
	public List<StudentSeminar> getAllSeminars() 
	{
		return studentSeminarRepository.findAll();
	}

	@Override
	public String saveArticle(StudentArticles articles) 
	{
		articleRepository.save(articles);
		return "Article Saved Successfully";
	}

	@Override
	public List<StudentArticles> ViewAllArticles() 
	{
		return articleRepository.findAll();
	}
	public StudentPortfolio addPortfolio(StudentPortfolio portfolio) {
        return repository.save(portfolio);
    }

    @Override
    public List<StudentPortfolio> getAllPortfolios() {
        return repository.findAll();
    }

    @Override
    public StudentPortfolio getPortfolioById(Long id) {
        return repository.findById(id).orElse(null);
    }

    @Override
    public void updatePortfolio(StudentPortfolio portfolio) {
        repository.save(portfolio);
    }

    @Override
    public void deletePortfolio(Long id) {
        repository.deleteById(id);
    }

}
