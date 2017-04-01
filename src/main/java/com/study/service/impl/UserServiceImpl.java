package com.study.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.dao.UserDao;
import com.study.model.User;
import com.study.service.UserService;
@Service
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserDao userDao;
	
	@Override
	public User FindUserWithRolesByName(String name) {
		return userDao.FindUserWithRolesByName(name);
	}

	@Override
	public PageInfo<User> selectByPage(User user,int page, int rows) {
        //分页查询
        PageHelper.startPage(page, rows);
        List<User> userlist = userDao.queryAll(user);
        return new PageInfo<>(userlist);
	}
	
}
