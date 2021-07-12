package com.phoenix.carrot.model.controller;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.phoenix.carrot.admin.biz.AdminProductBiz;
import com.phoenix.carrot.product.dto.ProductDto;
import com.phoenix.carrot.utils.UploadFileUtils;

@Controller
public class AdminProductController {

	private Logger logger = LoggerFactory.getLogger(AdminProductController.class);

	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	private AdminProductBiz adminproductbiz;
	
	
	/* adminproduct 게시판 ---------------------------------------------------*/
	/* 상품 리스트 */ 
	@RequestMapping("/adminproduct.do")
	public String adminProduct(Model model) {
		logger.info("[Controller] : adminproduct.do");
		model.addAttribute("adminProductList", adminproductbiz.adminProductList());

		return "adminproduct";
	}

	/* 상품등록 페이지 */
	@RequestMapping("/adminproductinsert.do")
	public String adminProductInsertForm() {
		return "adminproductinsert";
	}
	
	@RequestMapping("/adminproductinsertres.do")
	public String adminProductInsertRes(ProductDto dto, MultipartFile file) throws Exception {
		
		logger.info("[Controller] : adminproductinsertres.do");
		
		String imgUploadPath = uploadPath + File.separator + "upload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		
		if (file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = uploadPath + File.separator + "image" + File.separator +"none.png";
		}
		
		dto.setProductImg(File.separator + "upload" + ymdPath + File.separator + fileName);
		dto.setProductThumb(File.separator + "upload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		adminproductbiz.adminProductInsert(dto);
		
		return "redirect:adminproduct.do";
	}
	
	/* 상품 상세 정보 */
	@RequestMapping("/adminproductdetail.do")
	public String adminProductDetail(Model model, int productSeq) {
		logger.info("[Controller] : adminproductdetail.do");
		
		model.addAttribute("dto", adminproductbiz.adminProductOne(productSeq));
		return "adminproductdetail";
	}
	
	/* adminproduct 결제 ---------------------------------------------------*/
	/* 상품 주문 페이지 */
	@RequestMapping("/adminproductorder.do")
	public String adminproductOrder(Model model, int productSeq) {
		logger.info("[Controller] : adminproductorder.do");
		
		model.addAttribute("dto", adminproductbiz.adminProductOne(productSeq));

		return "adminproductorder";
	}

	/* 아임포트 결제 페이지*/
	@RequestMapping("/adminproductorderpay.do")
	public String adminproductorderPay(Model model, int productSeq) {
		logger.info("[Controller] : adminproductorderpay.do");
		
		model.addAttribute("dto", adminproductbiz.adminProductOne(productSeq));

		return "adminproductorderPay";
	}
	
}
