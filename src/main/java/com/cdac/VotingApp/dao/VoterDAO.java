package com.cdac.VotingApp.dao;

import java.util.Date;
import java.util.List;
import com.cdac.VotingApp.models.Voter;

public interface VoterDAO {
	
	public void addVoter(Voter voter);
	public boolean validateVoter(long adharno,String name,Date dob);
	public boolean deleteVoter(long adharno);
	public List<Voter> listVoter();
	public String voteOtp(long adharno);
}
