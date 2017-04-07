package com.study.service;

import com.github.pagehelper.PageInfo;
import com.study.model.User;
import com.study.model.UserRole;

public interface UserService {

	public User FindUserWithRolesByName(String name);
	
	 /**
     * 根据条件分页查询
     *
     * @param user
     * @param page
     * @param rows
     * @return
     */
    public PageInfo<User> selectByPage(User user, int page, int rows);
    
	public void saveUserRoles(UserRole userRole);
	
	public void addUser(User user);
}
