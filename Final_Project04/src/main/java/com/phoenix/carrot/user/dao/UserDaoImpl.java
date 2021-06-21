package com.phoenix.carrot.user.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phoenix.carrot.user.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public UserDto login(UserDto dto) {
		// TODO Auto-generated method stub
		
		UserDto res = null;
		
		try {
			res = sqlSession.selectOne(NAMESPACE+"login", dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			
		}
		
		return res;
	}

	@Override
	public int regist(UserDto dto) {
		// TODO Auto-generated method stub
		
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE+"regist", dto);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public int userUpdate(UserDto dto) {
		// TODO Auto-generated method stub
		return 0;
	}

}
