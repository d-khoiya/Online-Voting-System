package com.cdac.VotingApp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = {"com.cdac.VotingApp.controllers","com.cdac.VotingApp.dao","com.cdac.VotingApp.models","com.cdac.VotingApp.repository"})
public class VotingAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(VotingAppApplication.class, args);
	}

}
