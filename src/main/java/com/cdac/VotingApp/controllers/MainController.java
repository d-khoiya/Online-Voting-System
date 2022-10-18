package com.cdac.VotingApp.controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

	@RequestMapping("/index")
	public void index() {
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest req) {
		if (req.getSession(false) != null)
			req.getSession(false).invalidate();
		return "redirect:index";
	}
	
	@RequestMapping("/failure")
	public ModelAndView failure(@RequestParam("code")int code) {
		return new ModelAndView("failure","code",code);
	}
	
	@RequestMapping("/success")
	public ModelAndView success(HttpServletRequest req,@RequestParam("id")int id) {
		if (req.getSession(false) != null)
			req.getSession(false).invalidate();
		if(id == 1)
			return new ModelAndView("success","msg","Succesfully Voted!!");
		else if(id == 2)
			return new ModelAndView("success","msg","Wrong OTP!!");
		else
			return new ModelAndView("success");
	}
}
