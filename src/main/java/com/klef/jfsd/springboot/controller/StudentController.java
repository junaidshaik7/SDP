package com.klef.jfsd.springboot.controller;

import java.sql.Blob;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentAchievements;
import com.klef.jfsd.springboot.model.StudentArticles;
import com.klef.jfsd.springboot.model.StudentPerks;
import com.klef.jfsd.springboot.model.StudentPortfolio;
import com.klef.jfsd.springboot.model.StudentProject;
import com.klef.jfsd.springboot.model.StudentSeminar;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController 
{
	@Autowired
	private StudentService studentService;
	
	
	
	@GetMapping("/")
	public ModelAndView home()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("home");
		return mv;
	}
	@GetMapping("stdreg")
	public ModelAndView stdreg()
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("stdreg");
			return mv;
		}
	@GetMapping("stddashboard")
	public ModelAndView stddashboard() {
	    System.out.println("Navigating to student dashboard"); // Add this line for debugging
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("stddashboard");
	    return mv;
	}
	@GetMapping("stdlogin")
	public ModelAndView stdlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("stdlogin");
		return mv;
	}
	@PostMapping("insertstd")
	public ModelAndView insertstd(HttpServletRequest request)
	{
		String firstname = request.getParameter("sfirstname");
		String lastname = request.getParameter("slastname");
		String gender = request.getParameter("sgender");
		String dob = request.getParameter("sdob");
		String dept = request.getParameter("sdept");
		String location = request.getParameter("slocation");
		String email = request.getParameter("semail");
		String password = request.getParameter("spwd");
		String contact = request.getParameter("scontact");
		
		Student std = new Student();
		std.setFirstname(firstname);
		std.setLastname(lastname);
		std.setGender(gender);
		std.setDateofbirth(dob);
		std.setDepartment(dept);
		std.setLocation(location);
		std.setEmail(email);
		std.setPassword(password);
		std.setContact(contact);
		
		String msg = studentService.StudentRegistration(std);
		
		ModelAndView mv = new ModelAndView("regsuccess");
		mv.addObject("message",msg);
		
		return mv;
	}
	
	@PostMapping("checkstdlogin")
	public ModelAndView checkstdlogin(HttpServletRequest request)
	{
		ModelAndView mv = new ModelAndView();
		
		String semail = request.getParameter("semail");
		String spwd = request.getParameter("spwd");
		
		Student std = studentService.checkstdlogin(semail, spwd);
		if(std!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("student",std);
			
			mv.setViewName("stddashboard");
		}
		else
		{
			mv.setViewName("stdlogin");
			mv.addObject("message","Login failed");
		}
		return mv;
	}
	@GetMapping("stdhome")
	public ModelAndView stdhome()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("stdhome");
		return mv;
	}
	@GetMapping("stdprofile")
	public ModelAndView stdprofile()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("stdprofile");
		return mv;
	}
	@GetMapping("updatestd")
	public ModelAndView updatestd()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("updatestd");
		return mv;
	}
	@PostMapping("updatestdprofile")
	   public ModelAndView updateempprofile(HttpServletRequest request)
	   {
	     ModelAndView mv = new ModelAndView();
	     
	    try
	    {
	    	int id = Integer.parseInt(request.getParameter("sid"));
	    	String firstname = request.getParameter("sfirstname");
			String lastname = request.getParameter("slastname");
			String gender = request.getParameter("sgender");
			String dob = request.getParameter("sdob");
			String dept = request.getParameter("sdept");
			String location = request.getParameter("slocation");
			String email = request.getParameter("semail");
			String password = request.getParameter("spwd");
			String contact = request.getParameter("scontact");
			
			Student std = new Student();
			std.setId(id);
			std.setFirstname(firstname);
			std.setLastname(lastname);
			std.setGender(gender);
			std.setDateofbirth(dob);
			std.setDepartment(dept);
			std.setLocation(location);
			std.setEmail(email);
			std.setPassword(password);
			std.setContact(contact);
	        
	      	        
	        String msg = studentService.updateStudentProfile(std);
	        
	        
	        
	        Student s = studentService.displayStudentbyID(id);
	        
	         HttpSession session = request.getSession();
	         session.setAttribute("student",s); 
	       
	       
	        mv.setViewName("updatesuccess");
	        mv.addObject("message", msg);
	      
	    }
	    catch(Exception e)
	    {
	      mv.setViewName("updateerror");
	      mv.addObject("message", e);
	    }
	      return mv;
	   }
	 @GetMapping("stdprojects")
	    public ModelAndView stdprojects() {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("stdprojects"); 
	        return mv;
	    }
	        @PostMapping("/submitProject") 
	   
	    public ModelAndView submitProject(HttpServletRequest request) 
	     {
	        String projectTitle = request.getParameter("projectTitle");
	        String projectDescription = request.getParameter("projectDescription");
	        String category = request.getParameter("category");
	        String milestones = request.getParameter("milestones");
	        
			/*
			 * byte[] bytes = file.getBytes(); Blob blob = new
			 * javax.sql.rowset.serial.SerialBlob(bytes);
			 */

	        StudentProject project = new StudentProject();
	        project.setProjectTitle(projectTitle);
	        project.setProjectDescription(projectDescription);
	        project.setCategory(category);
	        project.setMilestones(milestones);
	       // project.setPdf(blob);

	     
	        String msg = studentService.saveProject(project);

	        ModelAndView mv = new ModelAndView("stdprojects");
	        mv.addObject("message", msg);
	        return mv;
	    }
	 @GetMapping("stdachievements")
		public ModelAndView stdachievements()
			{
				ModelAndView mv = new ModelAndView();
				mv.setViewName("stdachievements");
				return mv;
			}
	 @PostMapping("insertstdachievements")
		public ModelAndView insertstdachievements(HttpServletRequest request)
		{
			String achievementName = request.getParameter("sachievementName");
			String achievementDescription = request.getParameter("sachievementDescription");
			String dateachieved = request.getParameter("sdateachieved");
			
			StudentAchievements stdach= new StudentAchievements();
			
			stdach.setAchievementName(achievementName);
			stdach.setAchievementDescription(achievementDescription);
			stdach.setDateAchieved(dateachieved);
			
			
			
			String msg = studentService.StudentAchievements(stdach);
			
			ModelAndView mv = new ModelAndView("stdachievementssuccess");
			mv.addObject("message",msg);
			
			return mv;
		}
		
	 

	 @GetMapping("stdlogout")
		public ModelAndView stdlogout()
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("stdlogin");
			return mv;
		}
	 @GetMapping("viewallachievements")
	    public ModelAndView viewallachievements()
	    {
	      ModelAndView mv = new ModelAndView();
	      List<StudentAchievements> achievements = studentService.ViewAllAchievements();
	      mv.setViewName("viewallachievements");
	      mv.addObject("achievements",achievements);
	    
			
	      return mv;
	    }
	
	 @GetMapping("stdprojecttracking")
	 public ModelAndView stdprojecttracking() {
	     ModelAndView mv = new ModelAndView();
	     
	     // Retrieve all projects for the logged-in student (you might need to pass the student ID)
	     List<StudentProject> projects = studentService.getAllProjectsByStudentId();
	     
	     
	     // Set the view name and add the projects to the model
	     mv.setViewName("stdprojecttracking");
	     mv.addObject("projects", projects);
	     
	     return mv;
	 }
	 
	 @GetMapping("/viewallperks")
	    public ModelAndView viewAllPerks() {
	        ModelAndView mv = new ModelAndView("viewallperks");
	        List<StudentPerks> perks = studentService.getAllPerks();
	        mv.addObject("perks", perks);
	        return mv;
	    }
	 
	 @GetMapping("stdseminar")
		public ModelAndView stdseminar()
		{
			ModelAndView mv = new ModelAndView();
			mv.setViewName("stdseminar");
			return mv;
		}
	 @GetMapping("viewallseminars")
	    public ModelAndView viewAllSeminars() {
	        ModelAndView mv = new ModelAndView("viewallseminars");
	        List<StudentSeminar> seminars = studentService.getAllSeminars();
	        mv.addObject("seminars", seminars);
	        return mv;
	    }

	    @PostMapping("insertstdseminar")
	    public ModelAndView insertStdSeminar(HttpServletRequest request) {
	        String seminarTitle = request.getParameter("sseminartitle");
	        String seminarDescription = request.getParameter("sseminarDescription");
	        String seminarDate = request.getParameter("sdateachieved"); // String as date

	        StudentSeminar stdSeminar = new StudentSeminar();
	        stdSeminar.setTitle(seminarTitle);
	        stdSeminar.setDescription(seminarDescription);
	        stdSeminar.setDate(seminarDate);

	        StudentSeminar msg = studentService.addStudentSeminar(stdSeminar);

	        ModelAndView mv = new ModelAndView("stdseminarsuccess");
	        mv.addObject("message", msg);

	        return mv;
	    }
	    
	    @GetMapping("stdarticles")
	    public ModelAndView stdarticles() {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("stdarticles"); 
	        return mv;
	    }
	 @PostMapping("/submitarticle")
	    public ModelAndView submitarticle(HttpServletRequest request)  {
	        String articleTitle = request.getParameter("articleTitle");
	        String articleDescription = request.getParameter("articleDescription");
	        String category = request.getParameter("category");
	        

	        
	        StudentArticles articles = new StudentArticles();
	        articles.setArticleTitle(articleTitle);
	        articles.setArticleDescription(articleDescription);
	        articles.setArticlecategory(category);
	        
	     
	        String msg = studentService.saveArticle(articles);

	        ModelAndView mv = new ModelAndView("stdarticles");
	        mv.addObject("message", msg);
	        return mv;
	    }
	 @GetMapping("viewallarticles")
	    public ModelAndView viewallarticles()
	    {
	      ModelAndView mv = new ModelAndView();
	      List<StudentArticles> articles = studentService.ViewAllArticles();
	      mv.setViewName("viewallarticles");
	      mv.addObject("articles",articles);
	    
			
	      return mv;
	    }
	 @GetMapping("stdportfolio")
		public ModelAndView stdportfolio()
			{
				ModelAndView mv = new ModelAndView();
				mv.setViewName("stdportfolio");
				return mv;
			}
	 
	 @GetMapping("/student-portfolios")
	    public ModelAndView viewAllPortfolios() {
	        List<StudentPortfolio> portfolios = studentService.getAllPortfolios();
	        ModelAndView mav = new ModelAndView("student_portfolios");
	        mav.addObject("portfolios", portfolios);
	        return mav;
	    }

	    // Show form to add a new portfolio
	    @GetMapping("/add-student-portfolio")
	    public ModelAndView showAddPortfolioForm() {
	        return new ModelAndView("add_student_portfolio", "portfolio", new StudentPortfolio());
	    }

	    // Save a new portfolio
	    @PostMapping("/save-student-portfolio")
	    public String savePortfolio(@ModelAttribute StudentPortfolio portfolio) {
	    	studentService.addPortfolio(portfolio);
	        return "redirect:/student-portfolios";
	    }

	    // Show form to edit an existing portfolio
	    @GetMapping("/edit-student-portfolio")
	    public ModelAndView showEditPortfolioForm(@RequestParam Long id) {
	        StudentPortfolio portfolio = studentService.getPortfolioById(id);
	        return new ModelAndView("edit_student_portfolio", "portfolio", portfolio);
	    }

	    // Update an existing portfolio
	    @PostMapping("/update-student-portfolio")
	    public String updatePortfolio(@ModelAttribute StudentPortfolio portfolio) {
	    	studentService.updatePortfolio(portfolio);
	        return "redirect:/student-portfolios";
	    }

	    // Delete a portfolio
	    @GetMapping("/delete-student-portfolio")
	    public String deletePortfolio(@RequestParam Long id) {
	    	studentService.deletePortfolio(id);
	        return "redirect:/student-portfolios";
	    }

}
