package com.study.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.study.model.Resources;

@Controller
@RequestMapping("/resources")
public class ResourcesController {
	
	
	@RequestMapping("/loadResources.do")
	public List<Resources> loadResources(){
		
		return null;
	}
	
}
