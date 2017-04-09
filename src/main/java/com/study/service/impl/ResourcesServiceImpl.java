package com.study.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.study.dao.ResourcesDao;
import com.study.model.RResources;
import com.study.service.ResourcesService;
@Service
public class ResourcesServiceImpl implements ResourcesService{
	
	@Resource
	private ResourcesDao resourcesDao;
	
	@Override
	public List<RResources> resourcesListWithRole(Integer rid) {
		return resourcesDao.resourcesListWithRole(rid);
	}
	
}
