package com.phoenix.carrot.admin.dao;

import java.util.List;

import com.phoenix.carrot.admin.dto.NoticeBoardDto;

public interface NoticeBoardDao {

	String NAMESPACE = "upgrade.noticedmapper.";
	
	public List<NoticeBoardDto> selectList();
	public NoticeBoardDto selectOne(int admno);
	public int insert(NoticeBoardDto dto);
	public int update(NoticeBoardDto dto);
	public int delete(int admno);
	
	public String test();

	
}
