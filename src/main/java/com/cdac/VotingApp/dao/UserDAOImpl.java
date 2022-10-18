package com.cdac.VotingApp.dao;

import java.security.NoSuchAlgorithmException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdac.VotingApp.models.User;
import com.cdac.VotingApp.repository.UserRepository;
import com.cdac.VotingApp.utility.PasswordMsgDigest;

@Service
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	UserRepository userRepo;
	
	@Override
	public boolean addUser(User user) {
		if(!userRepo.existsById(user.getUsername())) {
			String pass = user.getPassword();
			try {
				pass = PasswordMsgDigest.toHexString(pass);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			user.setPassword(pass);
			user.setRole("user");
			userRepo.save(user);
			return true;
		}
		else
			return false;
	}

	@Override
	public String authenticate(String username, String password) {
		if(userRepo.existsById(username)) {
			User user = userRepo.findById(username).get();
			String pass = null;
			try {
				pass = PasswordMsgDigest.toHexString(password);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			if(pass.equals(user.getPassword())) {
				return user.getRole();
			}
		}
		return "nan";
		
	}

}
