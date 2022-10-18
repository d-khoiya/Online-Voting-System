package com.cdac.VotingApp.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cdac.VotingApp.dao.CandidateDAO;
import com.cdac.VotingApp.dao.ElectionDAO;
import com.cdac.VotingApp.dao.MailService;
import com.cdac.VotingApp.dao.VoterDAO;
import com.cdac.VotingApp.models.Voter;

@Controller
public class HomeController {

	@Autowired
	private VoterDAO voterDao;

	@Autowired
	private ElectionDAO elecDao;

	@Autowired
	private CandidateDAO candDao;
	
	@Autowired
	private MailService mail;

	@RequestMapping("/home")
	public void home() {
	}

	@RequestMapping("/elections")
	public ModelAndView elections() {
		return new ModelAndView("elections", "list", elecDao.listActivElection());
	}

	@RequestMapping("/candidate")
	public ModelAndView candidate(@RequestParam("eid") int eid) {
		return new ModelAndView("candidates", "list", candDao.listSelectedCandidate(eid));
	}

	@RequestMapping("/voterRegistration")
	public void voterRegistration(Model data) {
		data.addAttribute("voterDetails", new Voter());
	}

	@RequestMapping("/addVoter")
	public String addVoter(HttpServletRequest req) {
		voterDao.addVoter((Voter)req.getSession(false).getAttribute("voter"));
		req.getSession(false).removeAttribute("voter");
		return "redirect:home";
	}

	@RequestMapping("/verifyVoter")
	public ModelAndView verifyVoter(@ModelAttribute("voterDetails") Voter voter,HttpServletRequest req) {
		req.getSession(false).setAttribute("voterOtp", mail.sendEmailVerificationOTP(voter.getEmail()));
		req.getSession(false).setAttribute("voter",voter);
		return new ModelAndView("verifyOtp");
	}

	@RequestMapping("/validateVoter")
	public ModelAndView validateVoter(@ModelAttribute("voterDetails") Voter voter, HttpServletRequest req) {
		if (voterDao.validateVoter(voter.getAdharno(), voter.getName(), voter.getDob())) {
			req.getSession(false).setAttribute("voteOtp", voterDao.voteOtp(voter.getAdharno()));
			req.getSession(false).setAttribute("voterAdhar", voter.getAdharno());
			return new ModelAndView("verifyOtp");
		} else {
			return new ModelAndView("vote", "msg", "Invalid voter Details! Voting not allowed!");
		}
	}

	@RequestMapping("/vote")
	public void vote(Model data, HttpServletRequest req, @RequestParam("cid") int cid) {
		data.addAttribute("voterDetails", new Voter());
		req.getSession(false).setAttribute("cid", cid);
	}

	@RequestMapping("otpVerification")
	public String optVerification(@RequestParam("otp") String otp, HttpServletRequest req) {
		if (req.getSession(false).getAttribute("voterOtp") != null) {
			if (req.getSession(false).getAttribute("voterOtp").toString().equals(otp)) {
				req.getSession(false).removeAttribute("voterOtp");
				return "redirect:addVoter";
			}else {
				req.getSession(false).removeAttribute("voterOtp");
				req.getSession(false).removeAttribute("voter");
				return "redirect:voterRegistration";
			}
		} else if (req.getSession(false).getAttribute("voteOtp") != null) {
			if (req.getSession(false).getAttribute("voteOtp").toString().equals(otp)) {
				candDao.vote((int) req.getSession(false).getAttribute("cid"));
				voterDao.deleteVoter((long)req.getSession(false).getAttribute("voterAdhar"));
				return "redirect:success?id=1";
			}else {
				return "redirect:success?id=2";
			}
		}
		return "redirect:/logout";
	}
}
