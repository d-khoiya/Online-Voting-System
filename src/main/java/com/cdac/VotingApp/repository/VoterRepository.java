package com.cdac.VotingApp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cdac.VotingApp.models.Voter;

@Repository
public interface VoterRepository extends JpaRepository<Voter, Long>{

}
