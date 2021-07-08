package com.phoenix.carrot.model.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.carrot.admin.biz.AdminProductBiz;
import com.phoenix.carrot.product.dto.ProductDto;



@Controller
public class AdminProductController {
	
	private Logger logger = LoggerFactory.getLogger(AdminProductController.class);
	
	@Autowired
	private AdminProductBiz biz;
	
	
	@RequestMapping("/adminproduct.do")
	public String adminProduct() {
		logger.info("[Controller] : adminproduct.do");
		
        List<ProductDto> list = biz.adminProductList();
		
		return "adminproduct";
	}
	
}
