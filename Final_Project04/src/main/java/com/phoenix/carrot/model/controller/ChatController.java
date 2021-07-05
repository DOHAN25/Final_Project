package com.phoenix.carrot.model.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.phoenix.carrot.chat.biz.ChatRoomBiz;
import com.phoenix.carrot.chat.biz.MessageBiz;
import com.phoenix.carrot.chat.dto.ChatRoomDto;
import com.phoenix.carrot.chat.dto.MessageDto;
import com.phoenix.carrot.user.dto.UserDto;

@Controller
public class ChatController {

	private Logger logger = LoggerFactory.getLogger(SnsController.class);

	@Autowired
	ChatRoomBiz cbiz;

	@Autowired
	MessageBiz mbiz;

	@RequestMapping("/header.do")
	public String header(Model model) {
		logger.info("[Controller] : header.do");

		return "header";
	}
	
	
	// selleruserId = 판매자(상품을 올린 사람 아이디)
	@RequestMapping(value = "/chat.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String chatDo(@RequestParam("selleruserId") String selleruserId, @SessionAttribute("login") UserDto user,
			@RequestParam("productName") String productName, Model model) {

		String chatroom_buyer = user.getUserid();
		
		System.out.println("채팅방 개설 시작");
		ChatRoomDto cdto = new ChatRoomDto();
		cdto.setChatroom_buyer(chatroom_buyer);
		cdto.setChatroom_seller(selleruserId);
		cdto.setChatroom_title(productName);
		
		ChatRoomDto result = cbiz.selectOne(cdto);
		
		
		MessageDto mdto = new MessageDto();
		
		if(result == null) {
			
			int res = cbiz.createChatRoom(cdto);
			
		
			if(res > 0) {
				
			ChatRoomDto result2 = cbiz.selectOne(cdto);
			
			// 메세지 기본값 설정
			mdto.setChatroom_id(result2.getChatroom_id());
			mdto.setMessage_sender(result2.getChatroom_buyer());
			mdto.setMessage_receiver(result2.getChatroom_seller());
			mdto.setMessage_content("대화를 시작하세요. 욕설과 비속어 사용은 금지입니다. 매너있는 채팅 부탁드립니다.");
			
			
			int mres = mbiz.insertMessage(mdto);
			
			
			System.out.println(mres);
			
			if(mres > 0 ) {
				System.out.println("채팅방 개설 완료!");
			}
			
			}
			
		} else {
			
			List<MessageDto> mlist = mbiz.selectList(result.getChatroom_id());
			
			model.addAttribute("messageList", mlist);
			
			System.out.println("채팅방이 존재하여 해당 채팅방 메세지를 넘겨줍니다.");
			
		}

		

		return "chat";
	}
}
