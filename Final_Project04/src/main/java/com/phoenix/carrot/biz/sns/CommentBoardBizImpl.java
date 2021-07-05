package com.phoenix.carrot.biz.sns;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phoenix.carrot.dao.sns.CommentBoardDao;
import com.phoenix.carrot.dto.sns.CommentBoardDto;
import com.phoenix.carrot.dto.sns.EntireBoardDto;

@Service
public class CommentBoardBizImpl implements CommentBoardBiz {
	
	@Autowired
	private CommentBoardDao commentDao;

	@Override
	public EntireBoardDto boardWriteComment(CommentBoardDto commentdto) {
		// TODO Auto-generated method stub
		return commentDao.boardWriteComment(commentdto);
	}

	@Override
	public EntireBoardDto boardWriteReComment(CommentBoardDto commentdto) {
		// TODO Auto-generated method stub
		return commentDao.boardWriteReComment(commentdto);
	}

	@Override
	public ArrayList<CommentBoardDto> commentList(CommentBoardDto commentdto) {
		// TODO Auto-generated method stub
		return commentDao.commentList(commentdto);
	}

	@Override
	public EntireBoardDto boardDeleteComment(CommentBoardDto commentdto) {
		// TODO Auto-generated method stub
		return commentDao.boardDeleteComment(commentdto);
	}

	@Override
	public EntireBoardDto boardDeleteReComment(CommentBoardDto commentdto) {
		// TODO Auto-generated method stub
		return commentDao.boardDeleteReComment(commentdto);
	}

	@Override
	public EntireBoardDto profile_boardWriteComment(CommentBoardDto commentdto) {
		// TODO Auto-generated method stub
		return commentDao.profile_boardWriteComment(commentdto);
	}
	


}
