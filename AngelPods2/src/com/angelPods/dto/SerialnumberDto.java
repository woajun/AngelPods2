package com.angelPods.dto;

public class SerialnumberDto {

	private int dNum;
	private String userId;
	private int cNum;
	private int cdNum;
	private String imageSystemName;
	private String sn;
	
	public SerialnumberDto(int dNum, String userId, int cNum, int cdNum, String imageSystemName, String sn) {
		super();
		this.dNum = dNum;
		this.userId = userId;
		this.cNum = cNum;
		this.cdNum = cdNum;
		this.imageSystemName = imageSystemName;
		this.sn = sn;
	}
	
	public int getdNum() {
		return dNum;
	}
	public void setdNum(int dNum) {
		this.dNum = dNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getcNum() {
		return cNum;
	}
	public void setcNum(int cNum) {
		this.cNum = cNum;
	}
	public int getCdNum() {
		return cdNum;
	}
	public void setCdNum(int cdNum) {
		this.cdNum = cdNum;
	}
	public String getImageSystemName() {
		return imageSystemName;
	}
	public void setImageSystemName(String imageSystemName) {
		this.imageSystemName = imageSystemName;
	}
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	
	
	
}
