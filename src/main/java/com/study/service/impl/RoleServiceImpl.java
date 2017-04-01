package com.study.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.study.dao.RoleDao;
import com.study.model.Role;
import com.study.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService{
	
	@Resource
	private RoleDao roleDao;
	
	@Override
	public List<Role> findAllRolesWithResources() {
		return roleDao.findAllRolesWithResources();
	}

}
