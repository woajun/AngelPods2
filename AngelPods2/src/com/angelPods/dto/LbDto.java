package com.angelPods.dto;

import java.sql.Timestamp;

public class LbDto {

	private int lbNum;
	private String userId;
	private int cNum;
	private int cdNum;
	private Timestamp timestamp;
	private String sido;
	private String gue;
	private String dong;
	private String addrDetail;
	private String title;
	private String contents;
	private String sn;
	private String lat;
	private String lng;
	private int chatHit;
	private int hit;
	private int lState;
	private String cName;
	private String cdName;
	private String thumbnailImage;
	
	public LbDto() {}
	

	public LbDto(int lbNum, String userId, int cNum, int cdNum, Timestamp timestamp, String sido, String gue,
			String dong, String addrDetail, String title, String contents, String sn, String lat, String lng,
			int chatHit, int hit, int lState, String cName, String cdName, String thumbnailImage) {
		super();
		this.lbNum = lbNum;
		this.userId = userId;
		this.cNum = cNum;
		this.cdNum = cdNum;
		this.timestamp = timestamp;
		this.sido = sido;
		this.gue = gue;
		this.dong = dong;
		this.addrDetail = addrDetail;
		this.title = title;
		this.contents = contents;
		this.sn = sn;
		this.lat = lat;
		this.lng = lng;
		this.chatHit = chatHit;
		this.hit = hit;
		this.lState = lState;
		this.cName = cName;
		this.cdName = cdName;
		this.thumbnailImage = thumbnailImage;
	}


	public int getLbNum() {
		return lbNum;
	}

	public void setLbNum(int lbNum) {
		this.lbNum = lbNum;
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

	public Timestamp getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}


	public String getSido() {
		return sido;
	}


	public void setSido(String sido) {
		this.sido = sido;
	}


	public String getGue() {
		return gue;
	}


	public void setGue(String gue) {
		this.gue = gue;
	}


	public String getDong() {
		return dong;
	}


	public void setDong(String dong) {
		this.dong = dong;
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

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
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

	public int getlState() {
		return lState;
	}

	public void setlState(int lState) {
		this.lState = lState;
	}

	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public String getCdName() {
		return cdName;
	}

	public void setCdName(String cdName) {
		this.cdName = cdName;
	}

	public String getThumbnailImage() {
		return thumbnailImage;
	}

	public void setThumbnailImage(String thumbnailImage) {
		this.thumbnailImage = thumbnailImage;
	}
	
}