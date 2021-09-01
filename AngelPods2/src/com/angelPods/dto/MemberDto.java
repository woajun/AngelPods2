package com.angelPods.dto;

import java.sql.Timestamp;

public class MemberDto {

	private String userId;
	private String pw;
	private String name;
	private String eMail;
	private Timestamp rDate;
	private String addr;
	private int rankId;
	private String lat;
	private String lon;
	private String profilImage;
	
	public MemberDto() {}
	
	public MemberDto(String userId, String pw, String name, String eMail, Timestamp rDate, String addr, int rankId,
			String lat, String lon, String profilImage) {
		super();
		this.userId = userId;
		this.pw = pw;
		this.name = name;
		this.eMail = eMail;
		this.rDate = rDate;
		this.addr = addr;
		this.rankId = rankId;
		this.lat = lat;
		this.lon = lon;
		this.profilImage = profilImage;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public Timestamp getrDate() {
		return rDate;
	}
	public void setrDate(Timestamp rDate) {
		this.rDate = rDate;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public int getRankId() {
		return rankId;
	}
	public void setRankId(int rankId) {
		this.rankId = rankId;
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
	public String getProfilImage() {
		return profilImage;
	}
	public void setProfilImage(String profilImage) {
		this.profilImage = profilImage;
	}
}
