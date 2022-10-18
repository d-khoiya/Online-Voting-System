package com.cdac.VotingApp.controllers; 

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cdac.VotingApp.dao.UserDAO;
import com.cdac.VotingApp.models.User;

@Controller
public class UserController {
	
	@Autowired
	UserDAO userdao;
	
	@RequestMapping("/registerUser")
	public void registerUser(Model data) {
		data.addAttribute("userDetails", new User());
	}
	
	@RequestMapping("/addUser")
	public ModelAndView addUser(@ModelAttribute("userDtails")User user) {
		if(userdao.addUser(user))
			return new ModelAndView("index","msg","Registration successful.");
		else
			return new ModelAndView("registrerUser","msg","Registration failed!");
	}
	
	@RequestMapping("/userlogin")
	public void userlogin(Model data) {
		data.addAttribute("loginDetails", new User());
	}
	
	@RequestMapping("/authenticate")
	public ModelAndView authenticate(@ModelAttribute("loginDetails")User user ,HttpServletRequest req) {
		if(userdao.authenticate(user.getUsername(), user.getPassword()).equals("user")) {
			req.getSession().setAttribute("isAdmin", "no");
			return new ModelAndView("home","msg",user.getName());
		}
		else if(userdao.authenticate(user.getUsername(), user.getPassword()).equals("admin")) {
			req.getSession().setAttribute("isAdmin", "yes");
			return new ModelAndView("admin/welcome", "msg", user.getName());
		}
		else
			return new ModelAndView("userlogin","msg","Invalid username/password. Try again!");
	}
	
}