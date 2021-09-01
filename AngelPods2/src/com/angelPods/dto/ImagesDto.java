package com.angelPods.dto;

public class ImagesDto {

	private String imageSystemName;
	private String imageName;
	private String imageTable;
	private int tableId;
	private int idx;
	
	public ImagesDto(String imageSystemName, String imageName, String imageTable, int tableId, int idx) {
		super();
		this.imageSystemName = imageSystemName;
		this.imageName = imageName;
		this.imageTable = imageTable;
		this.tableId = tableId;
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
	public String getImageTable() {
		return imageTable;
	}
	public void setImageTable(String imageTable) {
		this.imageTable = imageTable;
	}
	public int getTableId() {
		return tableId;
	}
	public void setTableId(int tableId) {
		this.tableId = tableId;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	
	
}
