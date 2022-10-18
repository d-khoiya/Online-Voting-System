package com.cdac.VotingApp.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdac.VotingApp.models.Candidate;
import com.cdac.VotingApp.repository.CandidateRepository;

@Service
public class CandidateDAOImpl implements CandidateDAO {

	@Autowired
	CandidateRepository candRepo;

	@Override
	public void addCandidate(Candidate candidate) {
		candRepo.save(candidate);
	}

	@Override
	public boolean deleteCandidate(int cid, int eid) {
		if (candRepo.existsById(cid)) {
			candRepo.deleteById(cid);
			return true;
		} else
			return false;
	}

	@Override
	public List<Candidate> listCandidate() {
		return candRepo.findAll();
	}
	
	@Override
	public List<Candidate> listSelectedCandidate(int eid){
		List<Candidate> list = candRepo.findAll();
		list.removeIf(c -> c.getEid()!=eid);
		return list;
	}

	@Override
	public void vote(int cid) {
		Candidate candidate = candRepo.findById(cid).get();
		candidate.setVotes(candidate.getVotes()+1);
		candRepo.save(candidate);
	}

}
