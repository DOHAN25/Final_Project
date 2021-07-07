package com.phoenix.carrot.model.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.carrot.admin.biz.AdminProductBiz;



@Controller
public class AdminProductController {
	
	private Logger logger = LoggerFactory.getLogger(AdminProductController.class);
	
	@Autowired
	private AdminProductBiz biz;
	
	
	@RequestMapping("/adminproduct.do")
	public String adminProduct() {
		logger.info("[Controller] : adminproduct.do");
		
		return "adminproduct";
	}
	
}
