package com.angelPods.dto;

public class DevImgDto {

	private String imageSystemName;
	private String imageName;
	private int dNum;
	private int idx;
	
	public DevImgDto(String imageSystemName, String imageName, int dNum, int idx) {
		super();
		this.imageSystemName = imageSystemName;
		this.imageName = imageName;
		this.dNum = dNum;
		this.idx = idx;
	}
	
	public String getImageSystemName() {
		return imageSystemName;
	}
	public void setImageSystemName(String imageSystemName) {
		this.imageSystemName = imageSystemName;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public int getdNum() {
		return dNum;
	}
	public void setdNum(int dNum) {
		this.dNum = dNum;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	
}
