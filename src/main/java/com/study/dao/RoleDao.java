package com.study.dao;

import java.util.List;

import com.study.model.RoleResources;
import com.study.model.URole;

public interface RoleDao extends BaseDao{

	
	public List<URole> queryRoleListWithUser(Integer id);
	
	public void deleteRoleResources(Integer id);
	
	public void addRoleResources(RoleResources roleResources);
}
