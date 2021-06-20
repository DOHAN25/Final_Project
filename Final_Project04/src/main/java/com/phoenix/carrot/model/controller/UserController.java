package com.phoenix.carrot.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.carrot.user.biz.UserBiz;

@Controller
@RequestMapping("/login")
public class UserController {

	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private UserBiz biz;
	
	@RequestMapping("/loginform.do")
	public String goLoginForm() {
		
		return "loginpage";
	}
	
	
	
}
