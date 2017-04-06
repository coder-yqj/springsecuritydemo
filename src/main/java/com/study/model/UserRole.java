package com.study.model;

import java.io.Serializable;

public class UserRole implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8427279160142988516L;

	private String userId;
	private String roleId;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
	
	
	
}
