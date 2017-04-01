package com.study.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.study.model.Role;
import com.study.model.URole;
import com.study.model.User;

public interface RoleService {

	public List<Role> findAllRolesWithResources();
	
	public PageInfo<Role> selectByPage(Role role, int page, int rows);

	/**
	 * 查询所有角色，并且包含当前用户是否选中
	 * @param id
	 * @return
	 */
	public List<URole> queryRoleListWithUser(Integer id);
	
}
