package com.cdac.VotingApp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cdac.VotingApp.dao.CandidateDAO;
import com.cdac.VotingApp.dao.ElectionDAO;
import com.cdac.VotingApp.dao.VoterDAO;
import com.cdac.VotingApp.models.Candidate;
import com.cdac.VotingApp.models.Election;

@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private CandidateDAO candDao;
	
	@Autowired
	private ElectionDAO elecDao;
	
	@Autowired
	private VoterDAO voterDao;

	@RequestMapping("welcome")
	public void welcome() {}
	
	@RequestMapping("createElection")
	public void createElection(Model data) {
		data.addAttribute("electionDetails", new Election());
	}

	@RequestMapping("addElection")
	public String addElection(@ModelAttribute("electionDetails") Election election) {
		elecDao.addElection(election);
		return "redirect:listElection";
	}

	@RequestMapping("listElection")
	public ModelAndView listElection() {
		return new ModelAndView("admin/election", "list", elecDao.listElection());
	}

	@RequestMapping("deleteElection")
	public String deleteElection(@RequestParam("eid") int eid) {
		if (elecDao.deleteElection(eid))
			return "redirect:listElection";
		else
			return "redirect:/failure?code=1";
	}

	@RequestMapping("createCandidate")
	public void createCandidate(Model data) {
		data.addAttribute("candidateDetails", new Candidate());
		data.addAttribute("list", elecDao.listElection());
	}

	@RequestMapping("addCandidate")
	public String addCandidate(@ModelAttribute("candidateDetails") Candidate candidate) {
		candDao.addCandidate(candidate);
		return "redirect:listCandidate";
	}

	@RequestMapping("listCandidate")
	public ModelAndView listCandidate() {
		return new ModelAndView("admin/candidate", "list", candDao.listCandidate());
	}

	@RequestMapping("results")
	public ModelAndView results(@RequestParam("eid") int eid) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/results");
		mav.addObject("list", candDao.listSelectedCandidate(eid));
		if(elecDao.isActiveElection(eid))
			mav.addObject("resultMsg", "Election is active.Can not declare result");
		else if(!elecDao.isElectionDone(eid))
			mav.addObject("resultMsg", "Election yet to take place.Can not declare result");
		else
			mav.addObject("resultMsg", elecDao.winner(eid)+" is winner!");
		return mav;
	}

	@RequestMapping("deleteCandidate")
	public String deleteCandidate(@RequestParam(name = "cid") int cid, @RequestParam(name = "eid") int eid) {
		if (candDao.deleteCandidate(cid,eid))
			return "redirect:listCandidate";
		else
			return "redirect:/failure?code=2";
	}

	@RequestMapping("listVoter")
	public ModelAndView listVoter() {
		return new ModelAndView("admin/voter", "list", voterDao.listVoter());
	}

	@RequestMapping("deleteVoter")
	public String deleteVoter(@RequestParam("adharno") long adharno) {
		if (voterDao.deleteVoter(adharno))
			return "redirect:listVoter";
		else
			return "redirect:/failure?code=3";
	}

	@RequestMapping("activateElection")
	public String activateElection(@RequestParam("eid") int eid) {
		if (elecDao.activateElection(eid))
			return "redirect:listElection";
		else
			return "redirect:/failure?code=4";
	}

	@RequestMapping("deactivateElection")
	public String deactivateElection(@RequestParam("eid") int eid) {
		if (elecDao.deactivateElection(eid))
			return "redirect:listElection";
		else
			return "redirect:/failure?code=5";
	}
	
}
