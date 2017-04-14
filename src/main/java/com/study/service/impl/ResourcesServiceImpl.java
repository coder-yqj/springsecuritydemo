package com.study.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.study.dao.ResourcesDao;
import com.study.model.RResources;
import com.study.model.Resources;
import com.study.service.ResourcesService;
@Service("resourcesService")
public class ResourcesServiceImpl implements ResourcesService{
	
	@Resource
	private ResourcesDao resourcesDao;
	
	@Override
	public List<RResources> resourcesListWithRole(Integer rid) {
		return resourcesDao.resourcesListWithRole(rid);
	}

	@Override
	public PageInfo<Resources> selectByPage(Resources resources, int start, int length) {
		int page = start/length+1;  
		PageHelper.startPage(page, length);
        List<Resources> resourcelist = resourcesDao.queryAll(resources);
        return new PageInfo<>(resourcelist);
	}

	@Override
	@CacheEvict(cacheNames="myCache",allEntries=true)
	public void addResources(Resources resources) {
		resourcesDao.addEntity(resources);
	}
	
	@Override
	@CacheEvict(cacheNames="myCache",allEntries=true)
	public void delResources(Integer id) {
		resourcesDao.deleteEntity(id);
	}

	@Override
	@Cacheable(cacheNames="myCache",key="#resources.resUrl + #resources.username+#resources.type")
	public List<Resources> loadMenu(Resources resources) {
		return resourcesDao.loadMenu(resources);
	}
	@Cacheable(cacheNames="myCache")
	@Override
	public List<Resources> queryAll() {
		return resourcesDao.queryAll(new Resources());
	}
	
}
