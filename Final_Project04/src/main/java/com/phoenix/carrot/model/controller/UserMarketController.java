package com.phoenix.carrot.model.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.phoenix.carrot.product.biz.UserProductBiz;
import com.phoenix.carrot.product.dto.ProductDto;

@Controller
public class UserMarketController {
	
	private Logger logger = LoggerFactory.getLogger(UserMarketController.class);
	
	@Autowired
	private UserProductBiz biz;
	
	@RequestMapping("/jusoPopup.do")
    public String jusoPopup(){

        return "jusoPopup";

    }
	
	@RequestMapping("/usermarketplace.do")
	public String userProductList(Model model) {
		logger.info("[Controller] : usermarketplace.do");
		model.addAttribute("userProductList", biz.userProductList());
		return "userproductmarket";
	}
	
	@RequestMapping("/productinsert.do")
	public String productInsertForm() {
		return "userproductinsert";
	}
	
	@RequestMapping("/userproductinsertres.do")
	public String productInsertRes(ProductDto dto) {
		
		logger.info("[Controller] : userproductinsertres.do");
		
		if (biz.userProductInsert(dto) > 0) {
			return "redirect:usermarketplace.do";
		}
		
		return "redirect:userproductinsert.do";
	}
	
	@RequestMapping("/userproductdetail.do")
	public String productDetail(Model model, int productSeq) {
		logger.info("[Controller] : userproductdetail.do");
		
		model.addAttribute("dto", biz.userProductOne(productSeq));
		return "userproductdetail";
	}

}
