package com.phoenix.carrot.user.biz;

import com.phoenix.carrot.user.dto.UserDto;


public interface UserBiz {

	public UserDto login(UserDto dto);

	public int regist(UserDto dto);

	public int userUpdate(UserDto dto);
}
