package com.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping(value={"/index.do",""})
	public String index(){
		return "user/userList";
	}
	
	@RequestMapping("roles.do")
	public String roles(){
		return "role/roleList";
	}
	
	@RequestMapping("resources.do")
	public String resources(){
		return "resources/resourceList";
	}
}
