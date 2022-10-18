package com.cdac.VotingApp.dao;

import org.springframework.stereotype.Service;

@Service
public class OtpServiceImpl implements OtpService{

	@Override
	public String gerateOtp() {
		StringBuffer str = new StringBuffer();
		for(int i=0;i<6;i++) {
			int e = (int) (Math.random() * 10);
			str.append(e);
		}
		return str.toString();
	}

}
