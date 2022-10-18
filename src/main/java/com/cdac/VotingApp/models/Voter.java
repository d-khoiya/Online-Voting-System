package com.cdac.VotingApp.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "voters")
public class Voter {
	
	@Id
	@Column(name = "adharno")
	long adharno;
	
	@Column(name ="name")
	String name;
	
	@Column(name = "dob")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date dob;
	
	@Column(name = "gender")
	String gender;
	
	@Column(name = "phoneno")
	long phoneno;
	
	@Column(name = "email")
	String email;

	public long getAdharno() {
		return adharno;
	}

	public void setAdharno(long adharno) {
		this.adharno = adharno;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDob() {
		return dob;
	}
	
	public void setDob(Date dob) {
		this.dob = dob;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public long getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(long phoneno) {
		this.phoneno = phoneno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
