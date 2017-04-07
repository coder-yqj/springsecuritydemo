package com.study.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.study.model.User;
import com.study.model.UserRole;
import com.study.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Resource
	private UserService userService;
	/**
	 * 获取用户列表
	 * @param user 用户对象
	 * @param draw dataTables特有参数，原样返回即可
	 * @param start 起始数据
	 * @param length 每页的长度
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/userList.do")
	public Map<String,Object> userList(User user,String draw, 
			@RequestParam(required = false, defaultValue = "1") int start,
            @RequestParam(required = false, defaultValue = "10") int length){
		Map<String,Object> map = new HashMap<>();
		PageInfo<User> pageInfo = userService.selectByPage(user, start, length);
		System.out.println("pageInfo.getTotal():"+pageInfo.getTotal());
        map.put("draw",draw);
        map.put("recordsTotal",pageInfo.getTotal());
        map.put("recordsFiltered",pageInfo.getTotal());
        map.put("data", pageInfo.getList());
		return map;
	}
	
	/**
	 * 保存用户角色 
	 * @param userRole 用户角色
	 *  	  此处获取的参数的角色id是以 “,” 分隔的字符串
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/saveUserRoles.do")
	public String saveUserRoles(UserRole userRole){
		if(StringUtils.isEmpty(userRole.getUserId()))
		return "error";
		try {
			userService.saveUserRoles(userRole);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("/addUser.do")
	public String addUser(User user){
		try {
			userService.addUser(user);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			return "fail";
		}
	}
	
	
}
