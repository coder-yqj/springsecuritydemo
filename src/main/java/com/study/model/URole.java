package com.study.model;

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
