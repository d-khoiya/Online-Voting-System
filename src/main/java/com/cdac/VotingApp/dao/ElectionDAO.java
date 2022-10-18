package com.cdac.VotingApp.dao;

import java.util.List;

import com.cdac.VotingApp.models.Election;

public interface ElectionDAO {
	
	public void addElection(Election election);
	public boolean deleteElection(int eid);
	public List<Election> listElection();
	public List<Election> listActivElection();
	public boolean activateElection(int eid);
	public boolean deactivateElection(int eid);
	public boolean isActiveElection(int eid);
	public String winner(int eid);
	public boolean isElectionDone(int eid);
}
