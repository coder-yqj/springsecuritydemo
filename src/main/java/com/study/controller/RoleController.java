package com.study.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.pagehelper.PageInfo;
import com.study.model.Role;
import com.study.model.RoleResources;
import com.study.model.URole;
import com.study.service.RoleService;

@Controller
@RestController
@RequestMapping("/role")
public class RoleController {
	
	@Resource
	private RoleService roleService;
	
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
	@RequestMapping("/roleListWithUser.do")
	public List<URole> roleListWithUser(Integer uid){
		List<URole> list = roleService.queryRoleListWithUser(uid);
		return list;
	}
	
	/**
	 * 保存角色的权限
	 * @param roleResources
	 *  roleResources 中的resourcesId 现在是以“,”分隔的字符串
	 * @return
	 */
	@RequestMapping("/saveRoleResources.do")
	public String saveRoleResources(RoleResources roleResources){
		if(StringUtils.isEmpty(roleResources.getRoleId()))
			return "error";
		try {
			roleService.saveRoleResources(roleResources);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	/**
	 * 添加角色
	 * @return
	 */
	@RequestMapping("/addRole.do")
	public String addRole(Role role){
		try {
			roleService.addRole(role);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	@RequestMapping("/delRole.do")
	public String delRole(Integer id){
		try {
			roleService.delRole(id);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	@RequestMapping("/test.do")
	public String test(){
		try {
			roleService.testTransactional();
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
}
