package com.phoenix.carrot.biz.sns;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phoenix.carrot.dao.sns.LikeTableDao;
import com.phoenix.carrot.dto.sns.EntireBoardDto;
import com.phoenix.carrot.dto.sns.LikeTableDto;

@Service
public class LikeTableBizImpl implements LikeTableBiz {
	
	private Logger logger = LoggerFactory.getLogger(LikeTableBizImpl.class);
	
	@Autowired
	private LikeTableDao dao;

	@Override
	public EntireBoardDto pictureSaveHeart(LikeTableDto dto) {
		// TODO Auto-generated method stub
		return dao.pictureSaveHeart(dto);
	}

	@Override
	public EntireBoardDto pictureRemoveHeart(LikeTableDto dto) {
		// TODO Auto-generated method stub
		return dao.pictureRemoveHeart(dto);
	}

}
