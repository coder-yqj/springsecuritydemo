package com.study.dao;

import java.util.List;

import com.study.model.RResources;

public interface ResourcesDao extends BaseDao{
	
	public List<RResources> resourcesListWithRole(Integer rid);
}
