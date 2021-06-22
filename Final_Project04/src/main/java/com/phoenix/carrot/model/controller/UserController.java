package com.phoenix.carrot.model.controller;

import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.phoenix.carrot.user.biz.UserBiz;
import com.phoenix.carrot.user.dto.UserDto;

@Controller
public class UserController {
	
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	/*
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	*/
	@Autowired
	private UserBiz biz;
	
	@RequestMapping("/login.do")
	public String goLoginForm() {
		
		logger.info("[Controller] login.do");
		
		return "login";
	}
	
	/*
	@RequestMapping(value="/loginPost.do", method=RequestMethod.POST)
	public void  loginPost(UserDto dto, HttpSession session, Model model) {
		
		UserDto res = biz.login(dto);
		
		if(res == null || !passwordEncoder.matches(dto.getPassword(), res.getPassword())) {
			return;
		} 
		
		model.addAttribute("user", res);
		
	}
	*/
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:index";
	}
	
	@RequestMapping("/regist.do")
	public String registForm() {
		return "registform";
	}
	
	@RequestMapping(value="/registPost.do", method=RequestMethod.POST)
	public String registPost(UserDto dto, RedirectAttributes redirectAttributes) throws Exception {
		
		String hashedPw = BCrypt.hashpw(dto.getPassword(), BCrypt.gensalt());
		dto.setPassword(hashedPw);
		biz.regist(dto);
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");
		
		
		return "redirect:/login.do";
	}
	
	
}
