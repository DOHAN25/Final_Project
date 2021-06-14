package com.phoenix.carrot.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SnsController {

	@RequestMapping("/main.do")
	public String mainForm() {
			return "main";
	}
	
}
