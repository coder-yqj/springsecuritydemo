package com.study.model;

import java.io.Serializable;

/**
 * 角色资源实体类
 * @author Administrator
 *
 */
public class RoleResources implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3011087297090375810L;
	private String roleId;//角色id
	private String resourcesId;//资源id
	
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getResourcesId() {
		return resourcesId;
	}
	public void setResourcesId(String resourcesId) {
		this.resourcesId = resourcesId;
	}
	
	 
	
	
}
