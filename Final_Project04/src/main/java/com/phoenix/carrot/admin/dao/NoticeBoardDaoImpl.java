package com.phoenix.carrot.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phoenix.carrot.admin.dto.NoticeBoardDto;

@Repository
public class NoticeBoardDaoImpl implements NoticeBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<NoticeBoardDto> selectList() {

		List<NoticeBoardDto> list = new ArrayList<NoticeBoardDto>();

		try {
			list = sqlSession.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public NoticeBoardDto selectOne(int admno) {
		
		NoticeBoardDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOne", admno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int insert(NoticeBoardDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insert", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int update(NoticeBoardDto dto) {
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"update", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int delete(int admno) {
		
		int res = 0;
		
		try {
			res = sqlSession.delete(NAMESPACE+"delete", admno);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public String test() {
		return null;
	}

}
