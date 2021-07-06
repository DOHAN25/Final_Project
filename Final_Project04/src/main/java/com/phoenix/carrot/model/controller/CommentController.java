package com.phoenix.carrot.model.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.phoenix.carrot.biz.sns.CommentBoardBiz;
import com.phoenix.carrot.dto.sns.CommentBoardDto;
import com.phoenix.carrot.dto.sns.EntireBoardDto;

@Controller
public class CommentController {
	
	@Autowired
	private CommentBoardBiz commentbiz;
	
	//모댓글 작성
	@ResponseBody
	@RequestMapping(value="/boardInsertComment.do")
	public EntireBoardDto insertComment (@RequestParam int entireBoardSeq, @RequestParam String replyContent,HttpSession session) {
		
		CommentBoardDto commentdto = new CommentBoardDto();
		
		//게시물 번호 세팅
		commentdto.setEntireBoardSeq(entireBoardSeq);
		//내용세팅
		commentdto.setReplyContent(replyContent);
		//작성자 로그인한 유저의 아이디를 작성자로 세팅, 유저seq 세팅 (해줘야함)
		//commentdto.setUserSeq(session.getAttribute("userseq"));
		commentdto.setUserId((String)session.getAttribute("userid"));
		
		//+1된 댓글 갯수를 가져오기위함
		EntireBoardDto boarddto = commentbiz.boardWriteComment(commentdto);
		
		return boarddto;
	}
	
	//답글(대댓글)작성
	@ResponseBody
	@RequestMapping(value="/boardInsertReComment.do")
	public EntireBoardDto insertReComment(@RequestParam int entireBoardSeq,@RequestParam int commentNoSeq, @RequestParam String replyContent, HttpSession session) {
		
		CommentBoardDto commentdto = new CommentBoardDto();
		
		//게시물 번호 세팅 
		commentdto.setEntireBoardSeq(entireBoardSeq);
		//groupno, groupnonum, groupdepth 는 댓글dto에 int로 정의 되어 있기 때문에 
		//모댓글 번호 no를 그룹넘버로 세팅
		commentdto.setGroupNo(commentNoSeq);
		
		//답글은 깊이가 1이 되어야함 group뎁스를 1로세팅
		commentdto.setGroupDepth(1);
		//내용세팅
		commentdto.setReplyContent(replyContent);
		//작성자 세팅 유저seq세팅도 해주기
		commentdto.setUserId((String)session.getAttribute("userid"));
		//commentdto.setUserSeq(Integer.parseInt(session.getAttribute("userseq")));
		//댓글수 +1
		EntireBoardDto boarddto = commentbiz.boardWriteReComment(commentdto);
		return null;
	}

	//댓글리스트 출력 
	public ArrayList<CommentBoardDto> commentList(@RequestParam int commentNoSeq, HttpSession session ){
		
		CommentBoardDto commentdto = new CommentBoardDto();
		
		//가져올 댓글리스트의 게시물 번호 세팅
		commentdto.setEntireBoardSeq(commentNoSeq);
		
		ArrayList<CommentBoardDto> commentList = new ArrayList();
		
		commentList = commentbiz.commentList(commentdto);
		
		return commentList;
	}
	//모댓글삭제
	//댓글삭제

}



















