package com.phoenix.carrot.dao.sns;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phoenix.carrot.dto.sns.CommentBoardDto;
import com.phoenix.carrot.dto.sns.EntireBoardDto;

@Repository
public class CommentBoardDaoImpl implements CommentBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//댓글작성
	@Override
	public EntireBoardDto boardWriteComment(CommentBoardDto commentdto) {
		
		//게시판 테이블에 해당 게시물의 댓글수를 +1 하기 위한 세팅
		EntireBoardDto boarddto = new EntireBoardDto();
		boarddto.setEntireBoardSeq(commentdto.getEntireBoardSeq());
		
		//해당 게시물의 댓굴수를 +1 한다
		sqlSession.update(NAMESPACE + "board_reply_up", boarddto);
		
		//현재 댓글 테이블의 가장 큰 commentNoSeq 값을 가져온다.
		int groupNo = sqlSession.selectOne(NAMESPACE + "p_reply_max_no");
		
		//그룹번호 세팅
		commentdto.setGroupNo(groupNo + 1);
		
		int result = sqlSession.insert(NAMESPACE + "board_reply_write", commentdto);
		int check = sqlSession.selectOne(NAMESPACE + "p_reply_max_no");
		//groupno를 현재 가장 큰 번호 즉 방금 넣은 데이터의 commentNoSeq값으로 세팅
		commentdto.setGroupNo(check);
		
		//commentNoSeq와 groupNo가 다르면 groupNo를 commentNoSeq 로 업데이트
		int check_update = sqlSession.update(NAMESPACE + "board_reply_check", commentdto);
		
		if (result == 1) { //게시판 테이블에 새로운 댓글 추가가 성공하면
			//갱신된 댓글 갯수를 가져옴
			boarddto = sqlSession.selectOne(NAMESPACE + "board_reply_count", boarddto);
		}
		
		return boarddto;
	}
	
	//답글작성
	@Override
	public EntireBoardDto boardWriteReComment(CommentBoardDto commentdto) {
		// 게시판 테이블에서 해당 게시물의 댓굴 수를 +1하기위한 세팅
		EntireBoardDto boarddto = new EntireBoardDto();
		boarddto.setEntireBoardSeq(boarddto.getEntireBoardSeq());
		
		//해당 게시물의 댓굴수를 +1 한다.
		sqlSession.update(NAMESPACE + "board_reply_up", boarddto);
		
		//댓글 테이블에 추가 (댓글작성동일)
		int result = sqlSession.insert(NAMESPACE + "board_rereply_write", commentdto);
		
		if (result == 1) {
			//테이블에 새로운 댓글 추가가가 성공한다면
			//갱신된 댓글 갯수를 가져온다
			boarddto = sqlSession.selectOne(NAMESPACE+ "board_reply_count", boarddto);
		}
		return boarddto;
	}
	
	//댓글리스트
	@Override
	public ArrayList<CommentBoardDto> commentList(CommentBoardDto commentdto) {
		
		ArrayList<CommentBoardDto> commentList = new ArrayList();
		
		commentList = (ArrayList)sqlSession.selectList(NAMESPACE + "board_replyList" , commentdto);
		
		return commentList;
	}
	
	//모댓글 삭제
	@Override
	public EntireBoardDto boardDeleteComment(CommentBoardDto commentdto) {
		// 게시판 테이블에 해당 게시물의 댓굴수를 -1허가 위한 세팅
		EntireBoardDto boarddto = new EntireBoardDto();
		boarddto.setEntireBoardSeq(commentdto.getEntireBoardSeq());
		
		//groupno가 댓글의 commentnoseq와 일치하는 댓글이 몇개인지 카운트. 모댓글에 딸린 답글이 몇개인지 카운트하기 위함
		int count_recomment = sqlSession.selectOne(NAMESPACE + "board_count_rereply", commentdto);
		
		int result = 0;
		
		//해당 게시물의 댓글을 -1한다.
		sqlSession.update(NAMESPACE + "board_reply_down", boarddto);
		
		if(count_recomment == 0) {
			//답글이 없을때 - 그냥 삭제
			result = sqlSession.delete(NAMESPACE + "board_reply_delete", commentdto);
		} else {
			//답글이 있을때 - content에 공백을 넣음 ("삭제된 게시물입니다")
			//게시판 테이블에서 삭제하지 않고 content에 공백을 넣음 
			result = sqlSession.update(NAMESPACE + "board_reply_not_delete", commentdto);
		}
		
		if (result == 1) {
			//게시판 테이블에서 댓글삭제가 성공한다면
			//갱신된 댓글 갯수를 가져옴
			boarddto = sqlSession.selectOne(NAMESPACE + "board_reply_count", boarddto);
		}
		
		return boarddto;
	}
	
	//답글삭제
	@Override
	public EntireBoardDto boardDeleteReComment(CommentBoardDto commentdto) {
		//게시판 테이블에 해당 게시물의 댓글수를 -1하기 위한 세팅
		EntireBoardDto boarddto = new EntireBoardDto();
		boarddto.setEntireBoardSeq(commentdto.getEntireBoardSeq());
		
		//해당 게시물의 댓글수를 -1 한다.
		sqlSession.update(NAMESPACE + "board_reply_down", boarddto);
		
		//댓글테이블에서 삭제
		int result = sqlSession.delete(NAMESPACE + "board_reply_delete", commentdto);
		
		//그룹넘버가 일치하는 답글이 몇갠지 카운트 . 답글이 없고 모댓글의 content가 "" 이면 삭제 하기 위함
		int count_rereply = sqlSession.selectOne(NAMESPACE + "board_count_rereply_fromrereply", commentdto);
		System.out.println("count_rereply : " + count_rereply);
		
		if(count_rereply == 0) {
			sqlSession.delete(NAMESPACE + "board_reply_delete_after_rereply_delete", commentdto);
		}
		
		if (result == 1) {
			//댓글 테이블에서 댓글삭제가 성공한다면
			//갱신된 댓글 갯수를 가져옴
			boarddto = sqlSession.selectOne(NAMESPACE + "board_reply_count", boarddto);
		}
		
		return boarddto;
	}
	
	//댓글작성
	@Override
	public EntireBoardDto profile_boardWriteComment(CommentBoardDto commentdto) {
		//게시판 테이블에 해당 게시물의 댓굴수를 +1 하기 위한 dto 세팅
		EntireBoardDto boarddto = new EntireBoardDto();
		boarddto.setEntireBoardSeq(commentdto.getEntireBoardSeq());
		
		//해당 게시물의 댓글수를 +1한다.
		sqlSession.update(NAMESPACE + "board_reply_up", boarddto);
		
		//현재 게시판 테이블의 가장 큰 commentNo값을 가져온다.
		int groupNo = sqlSession.selectOne(NAMESPACE + "p_reply_max_no");
		
		//세팅
		commentdto.setGroupNo(groupNo+1);
		
		int result = sqlSession.insert(NAMESPACE + "board_reply_write", commentdto);
		int check = sqlSession.selectOne(NAMESPACE + "p_reply_max_no");
		//그룹넘버를 현재 가장 큰 commentno즉 방금 넣은 데이터의 no값으로 세팅
		commentdto.setGroupNo(check);
		
		//댓글번호와 그룹넘버가 다르면 그룹넘버를 댓글넘버로 업데이트
		//int check_update = sqlSession.update("picture_reply_check", to);
		
		if (result == 1) {
			//게시판 테이블에 새로운 댓글 추가가 성공한다면
			//갱신된 댓글 갯수를 가져온다
			boarddto = sqlSession.selectOne(NAMESPACE + "board_reply_count", boarddto);
		}
		
		return boarddto;
	}
	
	
}
