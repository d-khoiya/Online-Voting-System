package com.cdac.VotingApp.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "elections")
public class Election {
	
	@Id
	@GeneratedValue(generator = "increment")
	@Column(name = "eid")
	int eid;
	
	@Column(name = "name")
	String name;
	
	@Column(name = "date")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date date;
	
	@Column(name ="status")
	String status;

	public int getEid() {
		return eid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}
