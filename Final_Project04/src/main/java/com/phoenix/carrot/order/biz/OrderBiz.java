package com.phoenix.carrot.order.biz;

import java.util.HashMap;

import com.phoenix.carrot.order.dto.OrderDto;

public interface OrderBiz {
		//해당 아이디로 결제내역 추가
		public int productorderInsert(OrderDto params);

		//해당 아이디로 된 마지막 결제내역 확인
		public OrderDto productorderOne(int userSeq);
		
		
}
