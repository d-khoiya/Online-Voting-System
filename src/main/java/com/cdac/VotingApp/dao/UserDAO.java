package com.cdac.VotingApp.dao;

import com.cdac.VotingApp.models.User;

public interface UserDAO {
	
	public boolean addUser(User user);
	public String authenticate(String username, String password);
	
}
