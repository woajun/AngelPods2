package com.angelPods.dto;

public class CdDto {
	private	int cdNum;
	private int cNum;
	private String name;
	private String needSN;
	
	public int getCdNum() {
		return cdNum;
	}
	public void setCdNum(int cdNum) {
		this.cdNum = cdNum;
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
	public String getNeedSN() {
		return needSN;
	}
	public void setNeedSN(String needSN) {
		this.needSN = needSN;
	}
	public CdDto(int cdNum, int cNum, String name, String needSN) {
		super();
		this.cdNum = cdNum;
		this.cNum = cNum;
		this.name = name;
		this.needSN = needSN;
	}
	
	
}
