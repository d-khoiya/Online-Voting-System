package com.cdac.VotingApp.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	private JavaMailSender sender;
	
	@Autowired
	private OtpService otpServ;
	
	@Override
	public void sendEmail(String toEmail, String body, String subject) {
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setFrom("ashutosh.singh.firebase@gmail.com");
		message.setTo(toEmail);
		message.setText(body);
		message.setSubject(subject);
		
		sender.send(message);
	}

	@Override
	public String sendVoteOTP(String toEmail) {
		String otp = otpServ.gerateOtp();
		this.sendEmail(toEmail, "Your OTP for Voting is - "+otp, "OTP");
		return otp;
	}

	@Override
	public String sendEmailVerificationOTP(String toEmail) {
		String otp = otpServ.gerateOtp();
		this.sendEmail(toEmail, "Your Verification OTP is - "+otp, "OTP");
		return otp;
	}
}
