package com.phoenix.carrot.model.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phoenix.carrot.biz.sns.FollowBiz;
import com.phoenix.carrot.dto.sns.FollowDto;

@Controller
public class FollowControlloer {
	
	@Autowired
	private FollowBiz followbiz;
	
	@RequestMapping(value="/insertFollow.do", method=RequestMethod.POST)
	@ResponseBody
	public int insertFollow(Model model, String follower_ID, String following_ID, FollowDto followdto, HttpSession session) throws Exception {
		
		followbiz.insertFollow(followdto);
		String follower = followdto.getFollowerId();
		
		
		return null;
	};
}
