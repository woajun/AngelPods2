package com.angelPods.dto;

import java.sql.Timestamp;

public class DevDto {

	private int devNum;
	private String userId;
	private int cdNum;
	private String sn;
	private Timestamp timestamp;
	private String thumbnail;
	
	public DevDto(int devNum, String userId, int cdNum, String sn, Timestamp timestamp) {
		super();
		this.devNum = devNum;
		this.userId = userId;
		this.cdNum = cdNum;
		this.sn = sn;
		this.timestamp = timestamp;
	}
	
	public DevDto(int devNum, String userId, int cdNum, String sn, Timestamp timestamp, String thumbnail) {
		super();
		this.devNum = devNum;
		this.userId = userId;
		this.cdNum = cdNum;
		this.sn = sn;
		this.timestamp = timestamp;
		this.thumbnail = thumbnail;
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
	
	public String getSn() {
		return sn;
	}
	
	public void setSn(String sn) {
		this.sn = sn;
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
	
}
