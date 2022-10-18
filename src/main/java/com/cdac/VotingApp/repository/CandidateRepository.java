package com.cdac.VotingApp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cdac.VotingApp.models.Candidate;

@Repository
public interface CandidateRepository extends JpaRepository<Candidate, Integer>{

}
