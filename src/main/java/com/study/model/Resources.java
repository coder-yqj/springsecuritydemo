package com.study.model;

import java.io.Serializable;
import java.util.List;
/**
 * 资源实体类
 * @author Administrator
 *
 */
public class Resources implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -7749594385945332343L;
	private Integer id;
	private String name;//资源名称
	private String parentId;//父资源
	private String resUrl;//资源链接
	private Integer type;//资源类型   1:菜单    2：按钮
	private Integer sort;//排序
	
	private List<Role> roles; //可访问角色
	
	private String username;//只用于临时存储数据
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getResUrl() {
		return resUrl;
	}
	public void setResUrl(String resUrl) {
		this.resUrl = resUrl;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	@Override
	public String toString() {
		return "Resources [id=" + id + ", name=" + name + ", parentId="
				+ parentId + ", resUrl=" + resUrl + ", type=" + type
				+ ", sort=" + sort + ", roles=" + roles + ", username="
				+ username + "]";
	}
	 
	
	
	
}
