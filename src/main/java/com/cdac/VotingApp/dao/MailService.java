package com.cdac.VotingApp.dao;

public interface MailService {
	public void sendEmail(String toEmail, String body, String subject);
	public String sendVoteOTP(String toEmail);
	public String sendEmailVerificationOTP(String toEmail);
}
