package com.phoenix.carrot.model.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.carrot.product.biz.UserProductBiz;

@Controller
public class MarketController {
	
	private Logger logger = LoggerFactory.getLogger(MarketController.class);
	
	@Autowired
	private UserProductBiz biz;
	
	@RequestMapping("/marketplace.do")
	public String userProductList(Model model) {
		logger.info("[Controller] : marketplace.do");
		model.addAttribute("userProductList", biz.userProductList());
		return "usermarket";
	}
	
	@RequestMapping("/insertproduct.do")
	public String productInsertForm() {
		return "insertproduct";
	}

}
