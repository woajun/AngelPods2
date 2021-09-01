package com.angelPods.dto;

public class FImgDto {

	private String imageSystemName;
	private String imageName;
	private int fbNum;
	private int idx;
	
	public FImgDto(String imageSystemName, String imageName, int fbNum, int idx) {
		super();
		this.imageSystemName = imageSystemName;
		this.imageName = imageName;
		this.fbNum = fbNum;
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

	public int getFbNum() {
		return fbNum;
	}

	public void setFbNum(int fbNum) {
		this.fbNum = fbNum;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}
	
}
