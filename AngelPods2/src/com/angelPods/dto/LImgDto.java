package com.angelPods.dto;

public class LImgDto {

	private String imageSystemName;
	private String imageName;
	private int lbNum;
	private int idx;
	
	public LImgDto(String imageSystemName, String imageName, int lbNum, int idx) {
		super();
		this.imageSystemName = imageSystemName;
		this.imageName = imageName;
		this.lbNum = lbNum;
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

	public int getLbNum() {
		return lbNum;
	}

	public void setLbNum(int lbNum) {
		this.lbNum = lbNum;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}
	
}
