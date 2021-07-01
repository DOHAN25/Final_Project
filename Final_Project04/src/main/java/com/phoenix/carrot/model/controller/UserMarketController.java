package com.phoenix.carrot.model.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phoenix.carrot.product.biz.UserProductBiz;
import com.phoenix.carrot.product.dto.UserProductDto;

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
	public String productInsertRes(UserProductDto dto) {
		
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
	
	@RequestMapping(value="/searchProduct.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> searchProduct(HttpSession session,@RequestBody UserProductDto dto) {
		
		List<UserProductDto> list = new ArrayList<UserProductDto>();
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(dto.getSellerAddress() != "" || dto.getSellerAddress() != null) {
			list = biz.selectByaddr(dto.getSellerAddress());
			result.put("list", list);
		}
		
		return result;
	}

}
