package com.phoenix.carrot.biz.sns;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.phoenix.carrot.dto.sns.CommentBoardDto;
import com.phoenix.carrot.dto.sns.EntireBoardDto;

public interface CommentBoardBiz {
	
	//댓글 작성 
	public EntireBoardDto boardWriteComment(CommentBoardDto commentdto);
	//대댓글(답글) 작성
	public EntireBoardDto boardWriteReComment(CommentBoardDto commentdto);
	//댓글리스트
	public ArrayList<CommentBoardDto> commentList(CommentBoardDto commentdto);
	//모댓글 삭제
	public EntireBoardDto boardDeleteComment(CommentBoardDto commentdto);
	//대댓글 답글 삭제
	public EntireBoardDto boardDeleteReComment(CommentBoardDto commentdto);
	//댓글작성
	public EntireBoardDto profile_boardWriteComment(CommentBoardDto commentdto);
}
