package com.angelPods.dto;

public class CategoryDto {
	private int cNum;
	private String name;
	
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public CategoryDto(int cNum, String name) {
		super();
		this.cNum = cNum;
		this.name = name;
	}
	
	

}
