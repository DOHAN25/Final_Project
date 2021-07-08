package com.phoenix.carrot.admin.biz;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.phoenix.carrot.admin.dao.AdminProductDao;
<<<<<<< HEAD
=======

>>>>>>> c7f968089dcbb06d9ea7266cb57b690d0b61e4d0
import com.phoenix.carrot.product.biz.UserProductBizImpl;
import com.phoenix.carrot.product.dao.UserProductDao;
import com.phoenix.carrot.product.dto.ProductDto;

@Service
public class AdminProductBizImpl implements AdminProductBiz {
	
	private Logger logger = LoggerFactory.getLogger(UserProductBizImpl.class);

	@Override
	public List<ProductDto> adminProductList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ProductDto adminProductOne(int productSeq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int adminProductInsert(ProductDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminProductUpdate(ProductDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int adminProductDelete(int productSeq) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String adminproduct() {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
