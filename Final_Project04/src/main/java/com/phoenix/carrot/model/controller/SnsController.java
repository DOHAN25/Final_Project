package com.phoenix.carrot.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.carrot.biz.sns.SnsBoardBiz;

@Controller
public class SnsController {
	
	@Autowired
	private SnsBoardBiz biz;
	
	@RequestMapping("/main.do")
	public String mainForm(Model model) {
		
		model.addAttribute("snsBoardList", biz.snsBoardList());
		
		return "main";
	}
	
}
