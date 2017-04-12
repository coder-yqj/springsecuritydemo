package com.study.service;

import com.github.pagehelper.PageInfo;
import com.study.model.User;
import com.study.model.UserRole;

public interface UserService {

	public User findUserByName(String name);
	
	 /**
     * 根据条件分页查询
     *
     * @param user
     * @param page
     * @param rows
     * @return
     */
    public PageInfo<User> selectByPage(User user, int start, int length);
    
	public void saveUserRoles(UserRole userRole);
	
	public void addUser(User user);
	
	public void delUser(Integer id);
	
	public User queryByName(String username);
}
