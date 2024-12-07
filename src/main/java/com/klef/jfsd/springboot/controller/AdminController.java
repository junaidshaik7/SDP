package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Mentor;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentProject;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.MentorService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController 
{
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private MentorService mentorService;
	
	  @GetMapping("/adminhome") 
	  public ModelAndView home() 
	  { 
		  ModelAndView mv = new ModelAndView(); 
		  mv.setViewName("adminhome"); 
		  return mv; 
		  }
	 
	
	@PostMapping("checkadminlogin")
	//@ResponseBody
	public ModelAndView checkadminlogin(HttpServletRequest request)
	{
		ModelAndView mv  = new ModelAndView();
		
		String auname = request.getParameter("auname");
		String apwd = request.getParameter("apwd");
		
		Admin admin =  adminService.checkadminlogin(auname, apwd);
		if(admin!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("admin",admin );
			mv.setViewName("adminhome");
			
		}
		else
		{
			mv.setViewName("adminlogin");
			
		}
		return mv;
	}
	

	@GetMapping("adminlogin")  
	public ModelAndView adminlogin()
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("adminlogin");
		return mv;
	}
	
	@GetMapping("viewallstudents")
    public ModelAndView viewallstudents()
    {
      ModelAndView mv = new ModelAndView();
      List<Student> stulist = adminService.ViewAllStudents();
      mv.setViewName("viewallstudents");
      mv.addObject("stulist",stulist);
      return mv;
    }
	
	@GetMapping("deletestudent")
    public ModelAndView deletestudent()
    {
      ModelAndView mv = new ModelAndView();
      List<Student> stulist = adminService.ViewAllStudents();
      mv.setViewName("deletestudent");
      mv.addObject("stulist",stulist);
      return mv;
    }
	@GetMapping("delete")
	public String deleteOperation(@RequestParam("id") int sid)
	{
		adminService.deleteStudent(sid);
		return "redirect:/deletestudent";
	}
	
	@GetMapping("viewallprojs")
	public ModelAndView viewallprojsdemo()
	{
		List<StudentProject> projectlist = adminService.viewAllProjects();
		   
		   ModelAndView mv = new ModelAndView("viewallprojects");
		   
		   mv.addObject("projectlist", projectlist);
		   
		   return mv;
	}
	
	 @GetMapping("viewprojectbyid")
	 public ModelAndView  viewproductbyiddemo()
	 {
	 	   List<StudentProject> projectlist=adminService.viewAllProjects();
	 	   ModelAndView mv=new ModelAndView("viewprojectbyid");
	 	   mv.addObject("projectlist",projectlist);
	 	   return mv;
	 }
	
	 @PostMapping("displayproject")
	   public ModelAndView displayprojectdemo(HttpServletRequest request)
	   {
		   Long id=Long.parseLong(request.getParameter("id"));
		   StudentProject project=adminService.viewProjectByID(id);
		   ModelAndView mv=new ModelAndView("displayproject");
		   mv.addObject("project",project);
		   return mv;
	   }
	 @GetMapping("adminlogout")  
		public ModelAndView adminlogout()
		{
			ModelAndView mv = new ModelAndView("adminlogin");
			return mv;
		}
	 
	 @GetMapping("/mentorreg")
	    public ModelAndView mentorregr() {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("mentorreg");
	        return mv;
	    }

	 	@GetMapping("/addmentor") 
	 	public ModelAndView addmentor()
		 {
			 ModelAndView mv = new ModelAndView();
			 mv.setViewName("addmentor");
			 return mv;
			 
		 }
			/*
			 * @GetMapping("/mentorreg") public String showMentorRegPage() { return
			 * "mentorreg"; }
			 */
	 	

	    // Mentor Registration (POST request)
	    @PostMapping("/insertmentor")
	    public ModelAndView insertMentor(HttpServletRequest request) {
	        String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String gender = request.getParameter("gender");
	        String password = request.getParameter("password");
	        String department = request.getParameter("department");
	        String dateofbirth = request.getParameter("dateOfBirth");
	        String contact = request.getParameter("contact");
	        String location = request.getParameter("location");
	        double salary = Double.parseDouble(request.getParameter("salary"));
	        String status = "Registered";

	        Mentor mentor = new Mentor();
	        mentor.setName(name);
	        mentor.setGender(gender);
	        mentor.setEmail(email);
	        mentor.setPassword(password);
	        mentor.setDepartment(department);
	        mentor.setDateOfBirth(dateofbirth);
	        mentor.setContact(contact);
	        mentor.setLocation(location);
	        mentor.setSalary(salary);
	        mentor.setStatus(status);

	        String msg = mentorService.mentorRegistration(mentor);

	        ModelAndView mv = new ModelAndView("regsuccess");
	        mv.addObject("message", msg);

	        return mv;
	    }

	    // Mentor Login Page
	    @GetMapping("/mentorlogin")
	    public ModelAndView mentorlogin() {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("mentorlogin");
	        return mv;
	    }

	    // Mentor Login Validation (POST request)
	    @PostMapping("/checkmentorlogin")
	    public ModelAndView checkMentorLogin(HttpServletRequest request) {
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");

	        Mentor mentor = mentorService.checkMentorLogin(email, password);
	        ModelAndView mv = new ModelAndView();

	        if (mentor != null) {
	            HttpSession session = request.getSession();
	            session.setAttribute("mentor", mentor);  // Store mentor object in session
	            mv.setViewName("mentordashboard");
	        } else {
	            mv.setViewName("mentorloginfail");
	            mv.addObject("message", "Login Failed. Please check your credentials.");
	        }

	        return mv;
	    }

	    // Mentor Dashboard
	    @GetMapping("/mentordashboard")
	    public ModelAndView mentorDashboard(HttpServletRequest request) {
	        ModelAndView mv = new ModelAndView();
	        HttpSession session = request.getSession();
	        Mentor mentor = (Mentor) session.getAttribute("mentor");

	        if (mentor != null) {
	            mv.addObject("mentor", mentor);
	            mv.setViewName("mentordashboard");
	        } else {
	            mv.setViewName("mentorlogin");
	        }
	        return mv;
	    }

	    // Assign Project Page
	    @GetMapping("/assignproject")
	    public ModelAndView assignProjectPage() {
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("assignproject");
	        return mv;
	    }

	    // Assign Project to Student (POST request)
	    @PostMapping("/assignprojecttostudent")
	    public ModelAndView assignProjectToStudent(HttpServletRequest request) {
	        int mentorId = Integer.parseInt(request.getParameter("mentorId"));
	        int studentId = Integer.parseInt(request.getParameter("studentId"));
	        int projectId = Integer.parseInt(request.getParameter("projectId"));

	        String message = mentorService.assignProjectToStudent(mentorId, studentId, projectId);

	        ModelAndView mv = new ModelAndView("assignprojectsuccess");
	        mv.addObject("message", message);
	        return mv;
	    }

	    // Mentor Profile Update Page
	    @GetMapping("/updateprofile")
	    public ModelAndView updateProfile(HttpServletRequest request) {
	        ModelAndView mv = new ModelAndView();
	        HttpSession session = request.getSession();
	        Mentor mentor = (Mentor) session.getAttribute("mentor");

	        if (mentor != null) {
	            mv.addObject("mentor", mentor);
	            mv.setViewName("updateprofile");
	        } else {
	            mv.setViewName("mentorlogin");
	        }
	        return mv;
	    }

	    // Save Updated Mentor Profile (POST request)
	    @PostMapping("/updateMentorProfile")
	    public ModelAndView updateMentorProfile(HttpServletRequest request) {
	        HttpSession session = request.getSession();
	        Mentor mentor = (Mentor) session.getAttribute("mentor");

	        if (mentor != null) {
	            mentor.setName(request.getParameter("name"));
	            mentor.setEmail(request.getParameter("email"));
	            mentor.setContact(request.getParameter("contact"));
	            mentor.setDepartment(request.getParameter("department"));
	            mentor.setSalary(Double.parseDouble(request.getParameter("salary")));

	            mentorService.updateMentorProfile(mentor);

	            ModelAndView mv = new ModelAndView("updateprofilesuccess");
	            mv.addObject("message", "Profile updated successfully");
	            return mv;
	        } else {
	            ModelAndView mv = new ModelAndView("mentorlogin");
	            return mv;
	        }
	    }

	    // Mentor Logout (GET request)
	    @GetMapping("/mentorlogout")
	    public ModelAndView mentorLogout(HttpServletRequest request) {
	        HttpSession session = request.getSession();
	        session.removeAttribute("mentor");

	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("mentorlogout");
	        return mv;
	    }
	 
}