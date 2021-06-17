package com.phoenix.carrot.user.dao;

import com.phoenix.carrot.user.dto.UserDto;

public interface UserDao {

	public UserDto selectOne(String userId);
	public int join(UserDto dto);
	public int update(UserDto dto);
	public String duplicateCheckId(String userId);
	public String passwordCheck(String password);
	
	
	
}
