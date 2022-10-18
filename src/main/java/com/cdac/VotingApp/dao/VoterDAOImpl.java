package com.cdac.VotingApp.dao;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdac.VotingApp.models.Voter;
import com.cdac.VotingApp.repository.VoterRepository;

@Service
public class VoterDAOImpl implements VoterDAO {

	@Autowired
	VoterRepository voterRepo;
	
	@Autowired
	MailService mail;

	@Override
	public void addVoter(Voter voter) {
		voterRepo.save(voter);
	}

	@Override
	public boolean validateVoter(long adharno,String name,Date dob) {
		if (voterRepo.existsById(adharno)) {
			Voter voter = voterRepo.findById(adharno).get();
			if(name.equalsIgnoreCase(voter.getName()) && dob.compareTo(voter.getDob())==0) {
				return true;
			}
		}
		return false;
	}

	@Override
	public List<Voter> listVoter() {
		return voterRepo.findAll();
	}

	@Override
	public boolean deleteVoter(long adharno) {
		if (voterRepo.existsById(adharno)) {
			voterRepo.deleteById(adharno);
			return true;
		} else
			return false;
	}
	
	@Override
	public String voteOtp(long adharno) {
		return mail.sendVoteOTP(voterRepo.findById(adharno).get().getEmail());
	}
}
