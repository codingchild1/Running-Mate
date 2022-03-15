package com.mulcam.run.dto;

public class MyBoard {
	String id;
	int startrow;
	public MyBoard(String id, int startrow) {
		this.id = id;
		this.startrow = startrow;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	
	
}
