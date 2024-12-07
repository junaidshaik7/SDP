package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Student_table")
public class Student 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="std_id")
	private int id;
	@Column(name="std_firstname",nullable = false, length = 50)
	private String firstname;
	@Column(name = "std_lastname",nullable = false,length = 50)
	private String lastname;
	@Column(name="std_gender",nullable = false, length = 10)
	private String gender;
	@Column(name="std_dob",nullable = false,length = 20)
	private String dateofbirth;
	@Column(name="std_email",nullable = false,unique = true, length = 30)
	private String email;
	@Column(name="std_password",nullable = false,length = 30)
	private String password;
	@Column(name="std_location",nullable=false,length=50)
	private String location;
	@Column(name="std_department",nullable = false, length = 50)
	private String department;
	@Column(name="std_contact",nullable = false, unique = true, length = 20)
	private String contact;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	

}
