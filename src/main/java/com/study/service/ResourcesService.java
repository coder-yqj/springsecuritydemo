package com.study.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.study.model.RResources;
import com.study.model.Resources;
import com.study.model.Role;

public interface ResourcesService {
	
	public List<RResources> resourcesListWithRole(Integer rid);
	
	public PageInfo<Resources> selectByPage(Resources resources, int start, int length);
	
	public void addResources(Resources resources);
	
	public void delResources(Integer id);
	
	public List<Resources> loadMenu(Resources resources);

	public List<Resources>queryAll();
}
