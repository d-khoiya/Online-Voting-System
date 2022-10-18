package com.cdac.VotingApp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cdac.VotingApp.models.Election;

@Repository
public interface ElectionRepository extends JpaRepository<Election, Integer> {

}
