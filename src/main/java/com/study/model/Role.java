package com.study.model;

import java.io.Serializable;
import java.util.List;

public class Role implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2322564038632517975L;
	private Integer id;
	private String roleKey; //角色key
	private String roleDesc;//角色名称
	
	private List<Resources> resources;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRoleKey() {
		return roleKey;
	}
	public void setRoleKey(String roleKey) {
		this.roleKey = roleKey;
	}
	public String getRoleDesc() {
		return roleDesc;
	}
	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}
	
	public List<Resources> getResources() {
		return resources;
	}
	public void setResources(List<Resources> resources) {
		this.resources = resources;
	}
	
	@Override
	public String toString() {
		return "Role [id=" + id + ", roleKey=" + roleKey + ", roleDesc="
				+ roleDesc + ", resources=" + resources + "]";
	}
	 
	 
	
	
}
