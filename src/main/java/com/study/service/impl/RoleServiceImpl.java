package com.study.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.study.dao.RoleDao;
import com.study.model.Role;
import com.study.model.URole;
import com.study.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService{
	
	@Resource
	private RoleDao roleDao;
	
	@Override
	public List<Role> findAllRolesWithResources() {
		return roleDao.findAllRolesWithResources();
	}

	@Override
	public PageInfo<Role> selectByPage(Role role, int page, int rows) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<URole> queryRoleListWithUser(Integer id) {
		return roleDao.queryRoleListWithUser(id);
	}

}
