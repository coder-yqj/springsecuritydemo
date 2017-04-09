package com.study.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.study.model.RResources;
import com.study.model.Resources;
import com.study.service.ResourcesService;

@Controller
@RequestMapping("/resources")
public class ResourcesController {
	
	@Resource
	private ResourcesService resourcesService;
	
	/**
	 * 查询资源列表，并且返回指定角色是否拥有该资源的权限
	 * @param rid 角色id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/resourcesListWithRole.do")
	public List<RResources> resourcesListWithRole(Integer rid){
		List<RResources> list = resourcesService.resourcesListWithRole(rid);
		return list;
	}
	
	
}
