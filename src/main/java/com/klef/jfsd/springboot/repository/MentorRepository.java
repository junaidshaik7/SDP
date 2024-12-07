package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import com.klef.jfsd.springboot.model.Mentor;

@Repository
public interface MentorRepository extends JpaRepository<Mentor, Integer> {
    Mentor findByEmailAndPassword(String email, String password);
    
    @Query("select m from Mentor m where m.email=?1 and m.password=?2")
	public Mentor checkmentorlogin (String email,String password); 
}
