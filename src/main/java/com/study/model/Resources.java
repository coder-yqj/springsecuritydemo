package com.study.model;

public class Resources {
	private Integer id;
	private String name;//资源名称
	private String parentId;//父资源
	private String resUrl;//资源链接
	private Integer type;//资源类型   1:菜单    2：按钮
	private Integer sort;//排序
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
	@Override
	public String toString() {
		return "Resources [id=" + id + ", name=" + name + ", parentId="
				+ parentId + ", resUrl=" + resUrl + ", type=" + type
				+ ", sort=" + sort + "]";
	}
	 
	
	
	
}
