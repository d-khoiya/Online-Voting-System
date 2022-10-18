package com.cdac.VotingApp.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdac.VotingApp.models.Candidate;
import com.cdac.VotingApp.models.Election;
import com.cdac.VotingApp.repository.ElectionRepository;

@Service
public class ElectionDAOImpl implements ElectionDAO {

	@Autowired
	ElectionRepository elecRepo;

	@Autowired
	CandidateDAO candDao;

	@Override
	public void addElection(Election election) {
		elecRepo.save(election);
	}

	@Override
	public boolean deleteElection(int eid) {
		if (elecRepo.existsById(eid)) {
			elecRepo.deleteById(eid);
			return true;
		} else
			return false;
	}

	@Override
	public List<Election> listElection() {
		return elecRepo.findAll();
	}

	@Override
	public List<Election> listActivElection() {
		List<Election> list = elecRepo.findAll();
		list.removeIf(e -> e.getStatus().equalsIgnoreCase("inactive"));
		return list;
	}

	@Override
	public boolean activateElection(int eid) {
		if (elecRepo.existsById(eid)) {
			Election election = elecRepo.findById(eid).get();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			try {
				if (!this.isActiveElection(eid) && election.getDate().compareTo(sdf.parse(sdf.format(new Date()))) == 0) {
					election.setStatus("active");
					this.addElection(election);
					return true;
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public boolean deactivateElection(int eid) {
		if (elecRepo.existsById(eid)) {
			Election election = elecRepo.findById(eid).get();
			if (this.isActiveElection(eid)) {
				election.setStatus("inactive");
				this.addElection(election);
				return true;
			}
		}
		return false;
	}

	@Override
	public String winner(int eid) {
		List<Candidate> list = candDao.listSelectedCandidate(eid);
		if (list.isEmpty())
			return "";
		int winIndex = 0;
		for (int i = 1; i < list.size(); i++) {
			if (list.get(i).getVotes() > list.get(winIndex).getVotes())
				winIndex = i;
		}
		return list.get(winIndex).getName();
	}

	@Override
	public boolean isElectionDone(int eid) {
		Election election = elecRepo.findById(eid).get();
		if (election.getDate().compareTo(new Date()) < 0)
				return true;
		return false;
	}

	@Override
	public boolean isActiveElection(int eid) {
		Election election = elecRepo.findById(eid).get();
		if (election.getStatus().equals("active"))
			return true;
		return false;
	}

}
