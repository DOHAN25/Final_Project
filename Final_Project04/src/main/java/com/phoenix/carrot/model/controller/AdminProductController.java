package com.phoenix.carrot.model.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminProductController {

	@RequestMapping("/adminproduct.do")
	public String adminProduct() {
		return "adminproduct";
	}
	
	
}
