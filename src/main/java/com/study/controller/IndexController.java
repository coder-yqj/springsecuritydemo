package com.study.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.service.RoleService;

@Controller
public class IndexController {
	
	@Resource
	private RoleService roleService;
	
	@RequestMapping("index.do")
	public String index(){
		return "user/userList";
	}
	
}
