package com.study.dao;

import java.util.List;

import com.study.model.Role;

public interface RoleDao {

	public List<Role> findAllRolesWithResources();
}
