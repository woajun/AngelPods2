package com.angelPods.dto;

public class RankDto {

	private int rankId;
	private String rank;
	
	public RankDto(int rankId, String rank) {
		super();
		this.rankId = rankId;
		this.rank = rank;
	}
	public int getRankId() {
		return rankId;
	}
	public void setRankId(int rankId) {
		this.rankId = rankId;
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	
	
}
