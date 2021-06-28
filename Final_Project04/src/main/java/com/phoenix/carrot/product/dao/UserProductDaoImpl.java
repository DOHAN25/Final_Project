package com.phoenix.carrot.product.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phoenix.carrot.product.dto.ProductDto;

@Repository
public class UserProductDaoImpl implements UserProductDao {
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ProductDto> userProductList() {
		
		List<ProductDto> userProductList = new ArrayList<ProductDto>();
		
		try {
			userProductList = sqlSession.selectList(NAMESPACE + "userProductList");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userProductList;
	}

	@Override
	public ProductDto userProductOne(int productSeq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int userProductInsert(ProductDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int userProductUpdate(ProductDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int userProductDelete(int productSeq) {
		// TODO Auto-generated method stub
		return 0;
	}

}
