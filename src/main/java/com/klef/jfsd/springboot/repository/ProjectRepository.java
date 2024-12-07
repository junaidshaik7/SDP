package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.StudentProject;

@Repository
public interface ProjectRepository extends JpaRepository<StudentProject, Long> 
{
	
}
