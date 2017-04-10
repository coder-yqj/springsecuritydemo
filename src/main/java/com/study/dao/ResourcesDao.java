package com.study.dao;

import java.util.List;

import com.study.model.RResources;
import com.study.model.Resources;

public interface ResourcesDao extends BaseDao{
	
	public List<RResources> resourcesListWithRole(Integer rid);
	
	public List<Resources> findAllResourcesWithRoles();

}
