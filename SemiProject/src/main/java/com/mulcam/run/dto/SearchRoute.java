package com.mulcam.run.dto;

public class SearchRoute {
	String area;
	int distance_left;
	int distance_right;
	int startrow;
	
	SearchRoute(){}
	public SearchRoute(String area, int distance_left, int distance_right){
		if(area==null) {
			this.area = "null";
		}else {
			this.area = area;
		}
		this.distance_left = distance_left;
		this.distance_right = distance_right;
	}
	
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getDistance_left() {
		return distance_left;
	}
	public void setDistance_left(int distance_left) {
		this.distance_left = distance_left;
	}
	public int getDistance_right() {
		return distance_right;
	}
	public void setDistance_right(int distance_right) {
		this.distance_right = distance_right;
	}
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	
}
