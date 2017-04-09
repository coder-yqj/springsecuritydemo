package com.study.model;

/**
 * 用于前台 角色列表展示，selected 代表选择用户是否拥有该角色
 * @author Administrator
 *
 */
public class URole extends Role{
	
	private Integer selected;

	public Integer getSelected() {
		return selected;
	}

	public void setSelected(Integer selected) {
		this.selected = selected;
	}

	@Override
	public String toString() {
		return "URole [selected=" + selected + "]";
	}
	
	
}
