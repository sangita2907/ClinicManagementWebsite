package com.sangita.bo;

import java.util.ArrayList;
import java.util.Date;

public class Doctor {
	
	private long id;
	private String name;
	private String gender;
	private Date dob;
	private long contactNumber;
	private String email;
	private String qualification;
	private String specialist;
	private String role;
	private String password;
	private Date whenCreated;
	private ArrayList<String> dayList;
	private ArrayList<Integer> start_time;
	private ArrayList<Integer> end_time;
	
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public long getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(long contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getSpecialist() {
		return specialist;
	}
	public void setSpecialist(String specialist) {
		this.specialist = specialist;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public Date getWhenCreated() {
		return whenCreated;
	}
	public void setWhenCreated(Date whenCreated) {
		this.whenCreated = whenCreated;
	}
	public ArrayList<String> getDayList() {
		return dayList;
	}
	public void setDayList(ArrayList<String> dayList) {
		this.dayList = dayList;
	}
	public ArrayList<Integer> getStart_time() {
		return start_time;
	}
	public void setStart_time(ArrayList<Integer> start_time) {
		this.start_time = start_time;
	}
	public ArrayList<Integer> getEnd_time() {
		return end_time;
	}
	public void setEnd_time(ArrayList<Integer> end_time) {
		this.end_time = end_time;
	}
	
	
	
	
	




}
