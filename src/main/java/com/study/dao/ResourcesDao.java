package com.study.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.study.model.RResources;
import com.study.model.Resources;

public interface ResourcesDao extends BaseDao{
	
	public List<RResources> resourcesListWithRole(Integer rid);
	
	public List<Resources> findAllResourcesWithRoles();
	
	public List<Resources> loadMenu(Map<String, Object> map);
	
}
