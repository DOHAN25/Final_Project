package com.phoenix.carrot.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phoenix.carrot.admin.biz.AdminProductBiz;
import com.phoenix.carrot.admin.dto.AdminProductDto;
import com.sun.org.slf4j.internal.Logger;
import com.sun.org.slf4j.internal.LoggerFactory;

@Controller
public class AdminProductController {

	private Logger logger = LoggerFactory.getLogger(AdminProductController.class);

	@Autowired
	private AdminProductBiz biz;

	@RequestMapping("/adminproduct.do")
	public String selectList(Model model) {
		logger.info("[Controller] : list.do");
		
		model.addAttribute("list", biz.adminProductList());
		
		return "adminproductlist";
	}
	
	@RequestMapping("/writeform.do")
	public String insertForm() {
		logger.info("[Controller] : writeform.do");
		return "adminproductinsert";
	}
	
	@RequestMapping(value="/writeres.do", method=RequestMethod.POST)
	public String insertRes(AdminProductDto dto) {
		logger.info("[Controller] : writeres.do");
		
		if(biz.adminProductInsert(dto) > 0) {
			return "redirect:list.do";
		}
		return "redirect:writeform.do";
	}
	
	@RequestMapping("/detail.do")
	public String selectOne(Model model, int productSeq) {
		logger.info("[Controller] : detail.do");
		
		model.addAttribute("dto", biz.adminProductOne(productSeq));
		
		return "myboarddetail";
	}
	
	@RequestMapping("/delete.do")
	public String delete(int productSeq) {
		logger.info("[Controller] : delete.do");
		
		if(biz.delete(productSeq) > 0) {
			return "redirect:list.do";
		}
		return "redirect:detail.do?myno="+myno;
	}

	@RequestMapping("updateform.do")
	public String updateForm(Model model, int productSeq) {
		logger.info("[Controller] : updateform.do");
		
		model.addAttribute("dto", biz.selectOne(productSeq));
		
		return "myboardupdate";
	}
	
	@RequestMapping("/updateres.do")
	public String updateRes(AdminProductDto dto) {
		logger.info("[Controller] : updateres.do");
		
		if(biz.adminProductUpdate(dto) > 0) {
			return "redirect:detail.do?productSeq="+dto.getProductSeq();
		}
		return "redirect:updateform.do?productSeq="+dto.getProductSeq();
	}
	
	@RequestMapping("/adminproduct.do")
	public String adminProduct() {

		logger.info("[Controller] : adminproduct.do");

		biz.adminproduct();

		return "redirect:adminproduct.do";
	}

}
