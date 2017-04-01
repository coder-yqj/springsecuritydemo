package com.study.dao;

import com.study.model.User;

public interface UserDao extends BaseDao{
	
	public User FindUserWithRolesByName(String name);
	
}
