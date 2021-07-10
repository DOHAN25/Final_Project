package com.phoenix.carrot.order.biz;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.phoenix.carrot.order.dao.OrderDao;
import com.phoenix.carrot.order.dto.OrderDto;

@Service
public class OrderBizImpl implements OrderBiz {

	@Autowired
	private OrderDao orderdao;
	
	@Override
	public int productorderInsert(OrderDto orderDto) {
		return orderdao.productorderInsert(orderDto);
	}

	@Override
	public OrderDto productorderOne(int userSeq) {
		return orderdao.productorderOne(userSeq);
	}

}
