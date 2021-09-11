package com.angelPods.dto;

import java.sql.Timestamp;

public class DevDto {

	private int devNum;
	private String userId;
	private int cdNum;
	private String bodySN;
	private Timestamp timestamp;
	private String thumbnail;
	private String leftSN;
	private String rightSN;
	
	public DevDto(int devNum, String userId, int cdNum, String bodySN, Timestamp timestamp) {
		super();
		this.devNum = devNum;
		this.userId = userId;
		this.cdNum = cdNum;
		this.bodySN = bodySN;
		this.timestamp = timestamp;
	}
	
	public DevDto(int devNum, String userId, int cdNum, String bodySN, Timestamp timestamp, String thumbnail) {
		super();
		this.devNum = devNum;
		this.userId = userId;
		this.cdNum = cdNum;
		this.bodySN = bodySN;
		this.timestamp = timestamp;
		this.thumbnail = thumbnail;
	}
	
	

	public DevDto(int devNum, String userId, int cdNum, String bodySN, Timestamp timestamp, String thumbnail, String leftSN,
			String rightSN) {
		super();
		this.devNum = devNum;
		this.userId = userId;
		this.cdNum = cdNum;
		this.bodySN = bodySN;
		this.timestamp = timestamp;
		this.thumbnail = thumbnail;
		this.leftSN = leftSN;
		this.rightSN = rightSN;
	}

	public int getDevNum() {
		return devNum;
	}

	public void setDevNum(int devNum) {
		this.devNum = devNum;
	}

	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int getCdNum() {
		return cdNum;
	}
	
	public void setCdNum(int cdNum) {
		this.cdNum = cdNum;
	}
	
	public String getBodySN() {
		return bodySN;
	}

	public void setBodySN(String bodySN) {
		this.bodySN = bodySN;
	}

	public Timestamp getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getLeftSN() {
		return leftSN;
	}

	public void setLeftSN(String leftSN) {
		this.leftSN = leftSN;
	}

	public String getRightSN() {
		return rightSN;
	}

	public void setRightSN(String rightSN) {
		this.rightSN = rightSN;
	}
	
	
	
}
