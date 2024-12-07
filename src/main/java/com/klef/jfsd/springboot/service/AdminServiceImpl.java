package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Admin;
//import com.klef.jfsd.springboot.model.Project;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentProject;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.ProjectRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;


@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private ProjectRepository projectRepository;

	@Override
	public Admin checkadminlogin(String uname, String pwd) {
		return adminRepository.checkadminlogin(uname, pwd);
	}

	@Override
	public List<Student> ViewAllStudents() {
		return studentRepository.findAll();
	}

	@Override
	public String deleteStudent(int sid) 
	{
		studentRepository.deleteById(sid);
		return "Student Deleted Successfully";
	}

	@Override
	public List<StudentProject> viewAllProjects() 
	{
		return (List<StudentProject>) projectRepository.findAll();
		
	}

	@Override
	public StudentProject viewProjectByID(Long id) 
	{
		return projectRepository.findById(id).get();
	}
	
}