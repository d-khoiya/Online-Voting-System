package com.cdac.VotingApp.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;
@Entity
@Table(name = "candidates")
public class Candidate {
	
	@Id
	@GeneratedValue(generator = "increment")
	@Column(name ="cid")
	int cid;
	
	@Column(name = "eid")
	int eid;
	
	@Column(name = "name")
	String name;
	
	@Column(name = "party")
	String party;
	
	@Column(name = "dob")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date dob;
	
	@Column(name = "votes")
	int votes;

	public int getVotes() {
		return votes;
	}

	public void setVotes(int votes) {
		this.votes = votes;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getEid() {
		return eid;
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

	public String getParty() {
		return party;
	}

	public void setParty(String party) {
		this.party = party;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}
}
