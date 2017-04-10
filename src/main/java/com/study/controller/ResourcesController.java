package com.study.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.study.model.RResources;
import com.study.model.Resources;
import com.study.service.ResourcesService;

@Controller
@RestController
@RequestMapping("/resources")
public class ResourcesController {
	
	@Resource
	private ResourcesService resourcesService;
	
	
	/**
	 * 查询资源列表，并且返回指定角色是否拥有该资源的权限
	 * @param rid 角色id
	 * @return
	 */
	@RequestMapping("/resourcesListWithRole.do")
	public List<RResources> resourcesListWithRole(Integer rid){
		List<RResources> list = resourcesService.resourcesListWithRole(rid);
		return list;
	}
	
	
	@RequestMapping("/resourcesList.do")
	public Map<String,Object> resourcesList(Resources resources,String draw, 
			@RequestParam(required = false, defaultValue = "1") int start,
            @RequestParam(required = false, defaultValue = "10") int length){
		Map<String,Object> map = new HashMap<>();
		PageInfo<Resources> pageInfo = resourcesService.selectByPage(resources, start, length);
        map.put("draw",draw);
        map.put("recordsTotal",pageInfo.getTotal());
        map.put("recordsFiltered",pageInfo.getTotal());
        map.put("data", pageInfo.getList());
		return map;
	}
	
	@RequestMapping("/addResources.do")
	public String addResources(Resources resources){
		try {
			resourcesService.addResources(resources);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	
	@RequestMapping("/delResources.do")
	public String delResources(Integer id){
		try {
			resourcesService.delResources(id);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}

	@RequestMapping("/loadMenu.do")
	public List<Resources> loadMenu(HttpServletRequest request){
		SecurityContextImpl securityContextImpl = (SecurityContextImpl) request
				.getSession().getAttribute("SPRING_SECURITY_CONTEXT");
		String name = securityContextImpl.getAuthentication().getName();
		List<Resources> menu = resourcesService.loadMenu(name);
		return menu;
	}
	
}
