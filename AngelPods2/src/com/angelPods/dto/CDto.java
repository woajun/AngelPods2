package com.angelPods.dto;

import java.util.ArrayList;

public class CDto {
	private int cNum;
	private String name;
	private int idx;
	private ArrayList<CdDto> cdList;
	
	public CDto(int cNum, String name, int idx, ArrayList<CdDto> cdList) {
		super();
		this.cNum = cNum;
		this.name = name;
		this.idx = idx;
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

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	

}
