package com.study.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.study.model.Role;
import com.study.model.URole;
import com.study.service.RoleService;

@Controller
@RequestMapping("/role")
public class RoleController {
	
	@Resource
	private RoleService roleService;
	
	@ResponseBody
	@RequestMapping("/roleList.do")
	public Map<String,Object> userList(Role role,String draw, 
			@RequestParam(required = false, defaultValue = "1") int start,
            @RequestParam(required = false, defaultValue = "10") int length){
		Map<String,Object> map = new HashMap<>();
		PageInfo<Role> pageInfo = roleService.selectByPage(role, start, length);
        map.put("draw",draw);
        map.put("recordsTotal",pageInfo.getTotal());
        map.put("recordsFiltered",pageInfo.getTotal());
        map.put("data", pageInfo.getList());
		return map;
	}
	
	/**
	 * 查询角色列表，并且返回指定用户是否拥有该角色
	 * @param uid 用户id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/roleListWithUser.do")
	public List<URole> roleListWithUser(Integer uid){
		List<URole> list = roleService.queryRoleListWithUser(uid);
		return list;
	}
	
}
