package com.phoenix.carrot.model.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phoenix.carrot.biz.sns.CommentBoardBiz;

@Controller
public class CommentController {
	
	private Logger logger = LoggerFactory.getLogger(SnsController.class);
	
	@Autowired
	private CommentBoardBiz commentbiz;
	
	//댓글 등록
	@RequestMapping(value="/boardreplysave.do", method=RequestMethod.POST)
	@ResponseBody
	public Object boardReplySave(@RequestParam Map<String, Object> paramMap) {
		logger.info("[Controller] : boardreplysave.do");
		//리턴값 
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		//정보 입력
		int result = commentbiz.regReply(paramMap);
		
		
		if(result > 0) {
			retVal.put("code" , "OK");
			retVal.put("commentNoSeq" , paramMap.get("commentNoSeq"));
			retVal.put("groupNo" , paramMap.get("groupNo"));
			retVal.put("message" , "등록성공");
		} else {
			retVal.put("code" , "FAIL");
			retVal.put("message" , "등록실패");
		}
		
		return retVal;
	}

}



















