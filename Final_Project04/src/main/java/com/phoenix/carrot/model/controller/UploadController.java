package com.phoenix.carrot.model.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.ImportResource;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phoenix.carrot.dto.sns.EntireBoardDto;

public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	private String fileUpload(HttpServletRequest req, Model model,  EntireBoardDto dto, BindingResult result) {
		return null;
	}
}
