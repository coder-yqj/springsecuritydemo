package com.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;

import com.study.model.Role;
import com.study.service.RoleService;


public class TestRole extends SpringTestCase {
	
	@Resource(name="roleService")
	private RoleService roleService;

	@Test
	public void testRolesWithResources(){
		List<Role> resources = roleService.findAllRolesWithResources();
		System.out.println("resources:"+resources);
	}
}
