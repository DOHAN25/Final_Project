package com.phoenix.carrot.admin.dao;

import java.util.ArrayList;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phoenix.carrot.dto.sns.EntireBoardDto;

@Repository
public class NoticeBoardDaoImpl implements NoticeBoardDao {

	@Override
	public List<EntireBoardDto> noticeBoardList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EntireBoardDto noticeBoardOne(int entireBoardSeq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int noticeBoardInsert(EntireBoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int noticeBoardUpdate(EntireBoardDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int noticeBoardDelete(int entireBoardSeq) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
