package com.phoenix.carrot.biz.sns;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phoenix.carrot.dao.sns.SnsBoardDao;
import com.phoenix.carrot.dto.sns.EntireBoardDto;

@Service
public class SnsBoardBizImpl implements SnsBoardBiz {
	
	@Autowired
	private SnsBoardDao dao;
	
	@Override
	public List<EntireBoardDto> snsBoardList() {
		
		return dao.snsBoardList();
	}

	@Override
	public EntireBoardDto snsBoardOne(int entireBoardSeq) {
		
		return dao.snsBoardOne(entireBoardSeq);
	}

	@Override
	public int snsBoardInsert(EntireBoardDto dto) {
		
		return dao.snsBoardInsert(dto);
	}

	@Override
	public int snsBoardUpdate(EntireBoardDto dto) {
		
		return dao.snsBoardUpdate(dto);
	}

	@Override
	public int snsBoardDelete(int entireBoardSeq) {
	
		return dao.snsBoardDelete(entireBoardSeq);
	}

}
