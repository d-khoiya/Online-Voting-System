package com.cdac.VotingApp.dao;

import java.util.List;

import com.cdac.VotingApp.models.Candidate;

public interface CandidateDAO {

	public void addCandidate(Candidate candidate);

	public boolean deleteCandidate(int cid,int eid);

	public List<Candidate> listCandidate();
	
	public List<Candidate> listSelectedCandidate(int eid);
	
	public void vote(int cid);
	
}
