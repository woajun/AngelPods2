package com.angelPods.dto;

import java.util.ArrayList;

public class CDto {
	private int cNum;
	private String name;
	private ArrayList<CdDto> cdList;
	
	public CDto(int cNum, String name, ArrayList<CdDto> cdList) {
		super();
		this.cNum = cNum;
		this.name = name;
		this.cdList = cdList;
	}
	
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
	public CDto(int cNum, String name) {
		super();
		this.cNum = cNum;
		this.name = name;
	}
	public ArrayList<CdDto> getCdList() {
		return cdList;
	}
	public void setCdList(ArrayList<CdDto> cdList) {
		this.cdList = cdList;
	}
	
	

}
