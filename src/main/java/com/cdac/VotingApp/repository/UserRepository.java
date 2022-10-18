package com.cdac.VotingApp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cdac.VotingApp.models.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> {

}
