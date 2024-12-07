package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.StudentPortfolio;

@Repository
public interface StudentPortfolioRepository extends JpaRepository<StudentPortfolio, Long> {
    // Custom methods (if needed)
}
