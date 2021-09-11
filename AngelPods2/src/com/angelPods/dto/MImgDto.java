package com.angelPods.dto;

public class MImgDto {
	private String imageSystemName;
	private String imageName;
	private String userId;
	
	public MImgDto(String imageSystemName, String imageName, String userId) {
		super();
		this.imageSystemName = imageSystemName;
		this.imageName = imageName;
		this.userId = userId;
	}
	
	public MImgDto() {
		
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
