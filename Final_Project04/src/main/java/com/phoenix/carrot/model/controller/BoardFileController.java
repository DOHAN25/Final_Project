package com.phoenix.carrot.model.controller;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ImportResource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.phoenix.carrot.biz.sns.BoardFileBiz;
import com.phoenix.carrot.dto.sns.EntireBoardDto;
import com.phoenix.carrot.utils.UploadFileUtils;

@Controller
public class BoardFileController {
	
	/*
	private static final Logger logger = LoggerFactory.getLogger(BoardFileController_2.class);
	
	@Autowired
	private BoardFileBiz boardFileBiz;
	
	//파일 저장 기본 경로 bean등록 
	//들어가면 경로를 수정해보자...
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	
	//업로드 파일
	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	private ResponseEntity<String> uploadFile(MultipartFile file) throws Exception {
		
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.CREATED);
	}
	*/
}
