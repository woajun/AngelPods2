package com.angelPods.dto;

import java.sql.Timestamp;

public class FindBoardDto {

	private int fbNum;
	private String userId;
	private int cNum;
	private int cdNum;
	private String thumbnailImage;
	private Timestamp timestamp;
	private String addr;
	private String addrDetail;
	private String title;
	private String contents;
	private String sn;
	private String lat;
	private String lon;
	private int chatHit;
	private int hit;
	private int fState;
	
	public FindBoardDto() {}

	public FindBoardDto(int fbNum, String userId, int cNum, int cdNum, String thumbnailImage, Timestamp timestamp,
			String addr, String addrDetail, String title, String contents, String sn, String lat, String lon,
			int chatHit, int hit, int fState) {
		super();
		this.fbNum = fbNum;
		this.userId = userId;
		this.cNum = cNum;
		this.cdNum = cdNum;
		this.thumbnailImage = thumbnailImage;
		this.timestamp = timestamp;
		this.addr = addr;
		this.addrDetail = addrDetail;
		this.title = title;
		this.contents = contents;
		this.sn = sn;
		this.lat = lat;
		this.lon = lon;
		this.chatHit = chatHit;
		this.hit = hit;
		this.fState = fState;
	}

	public int getFbNum() {
		return fbNum;
	}

	public void setFbNum(int fbNum) {
		this.fbNum = fbNum;
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

	public String getThumbnailImage() {
		return thumbnailImage;
	}

	public void setThumbnailImage(String thumbnailImage) {
		this.thumbnailImage = thumbnailImage;
	}

	public Timestamp getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddrDetail() {
		return addrDetail;
	}

	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getSn() {
		return sn;
	}

	public void setSn(String sn) {
		this.sn = sn;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLon() {
		return lon;
	}

	public void setLon(String lon) {
		this.lon = lon;
	}

	public int getChatHit() {
		return chatHit;
	}

	public void setChatHit(int chatHit) {
		this.chatHit = chatHit;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getfState() {
		return fState;
	}

	public void setfState(int fState) {
		this.fState = fState;
	}
}