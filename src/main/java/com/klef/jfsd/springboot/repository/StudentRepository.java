package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Student;

import jakarta.transaction.Transactional;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer>
{
	@Query("select s from Student s where s.email =?1 and s.password=?2")
	public Student checkstdlogin(String email,String pwd);
	
	@Modifying
	@Transactional
	@Query("update Student s set s.dateofbirth=?1 where s.id=?2")
	public int updateStudent(String dateofbirth, int id);
	
	
	

}
