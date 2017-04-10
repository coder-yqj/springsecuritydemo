package com.study.dao;

import com.study.model.User;
import com.study.model.UserRole;

public interface UserDao extends BaseDao{
	
	public User FindUserWithRolesByName(String name);
	
	public void delRolesByUserId(String userId);
	
	public void addUserRole(UserRole userRole);
	
	public User queryByName(String username);
}
