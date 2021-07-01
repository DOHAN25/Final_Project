package com.phoenix.carrot.product.biz;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phoenix.carrot.biz.sns.SnsBoardBizImpl;
import com.phoenix.carrot.product.dao.UserProductDao;
import com.phoenix.carrot.product.dto.UserProductDto;

@Service
public class UserProductBizImpl implements UserProductBiz {
	
	private Logger logger = LoggerFactory.getLogger(UserProductBizImpl.class);
	
	@Autowired
	private UserProductDao dao;
	
	@Override
	public List<UserProductDto> userProductList() {

		return dao.userProductList();
	}

	@Override
	public UserProductDto userProductOne(int productSeq) {

		return dao.userProductOne(productSeq);
	}

	@Override
	public int userProductInsert(UserProductDto dto) {

		return dao.userProductInsert(dto);
	}

	@Override
	public int userProductUpdate(UserProductDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int userProductDelete(int productSeq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<UserProductDto> selectByaddr(String addr) {
		// TODO Auto-generated method stub
		return dao.selectByaddr(addr);
	}

}
