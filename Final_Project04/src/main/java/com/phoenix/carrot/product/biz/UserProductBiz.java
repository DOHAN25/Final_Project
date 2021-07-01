package com.phoenix.carrot.product.biz;

import java.util.List;

import com.phoenix.carrot.product.dto.UserProductDto;

public interface UserProductBiz {
	
	//유저상품리스트출력
	public List<UserProductDto> userProductList();
	//유저등록상품상세출력
	public UserProductDto userProductOne(int productSeq);
	//유저상품등록
	public int userProductInsert(UserProductDto dto);
	//유저상품수정
	public int userProductUpdate(UserProductDto dto);
	//유저상품삭제
	public int userProductDelete(int productSeq);
	
	// 주소로 상품 검색
	public List<UserProductDto> selectByaddr(String addr);

}
