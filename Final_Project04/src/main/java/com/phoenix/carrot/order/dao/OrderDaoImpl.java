package com.phoenix.carrot.order.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phoenix.carrot.order.dto.OrderDto;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int productorderInsert(OrderDto orderDto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "productorderInsert", orderDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	

	@Override
	public OrderDto productorderOne(int userSeq) {
		OrderDto dto = null;
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "productorderOne", userSeq);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
