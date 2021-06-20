package com.phoenix.carrot.user.dao;

import com.phoenix.carrot.user.dto.UserDto;

public interface UserDao {
	
	String NAMESPACE = "userMapper.";

	public UserDto login(UserDto dto);

	public int regist(UserDto dto);

	public int userUpdate(UserDto dto);

}
