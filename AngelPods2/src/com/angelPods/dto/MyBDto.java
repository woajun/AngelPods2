package com.angelPods.dto;

public class MyBDto {
	public String brdName; //게시판 이름
	public int cdNum;
	public String title;
	public String rDate;
	
	public MyBDto(String brdName, int cdNum, String title, String rDate) {
		super();
		this.brdName = brdName;
		this.cdNum = cdNum;
		this.title = title;
		this.rDate = rDate;
	}
	
	public String getBrdName() {
		return brdName;
	}
	public void setBrdName(String brdName) {
		this.brdName = brdName;
	}
	public int getCdNum() {
		return cdNum;
	}
	public void setCdNum(int cdNum) {
		this.cdNum = cdNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getrDate() {
		return rDate;
	}
	public void setrDate(String rDate) {
		this.rDate = rDate;
	}
}
