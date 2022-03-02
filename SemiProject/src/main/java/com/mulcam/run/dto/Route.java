package com.mulcam.run.dto;

import java.sql.Date;

public class Route {
	int route_articleNo;
	String user_id;
	String route_title;
	String route_thumb;
	Date route_date;
	int route_views;
	int route_likes;
	String route_content;
	String route_mapinfo;
	String route_area;
	double route_distance;
	boolean warning;
	
	public Route() {}
	public Route( int route_articleNo, String user_id, String route_title, String route_thumb, Date route_date,
			int route_views, int route_likes, String route_content, 
			String route_mapinfo, String route_area, double route_distance, boolean warning) {
		
	}
	public int getRoute_articleNo() {
		return route_articleNo;
	}
	public void setRoute_articleNo(int route_articleNo) {
		this.route_articleNo = route_articleNo;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRoute_title() {
		return route_title;
	}
	public void setRoute_title(String route_title) {
		this.route_title = route_title;
	}
	public String getRoute_thumb() {
		return route_thumb;
	}
	public void setRoute_thumb(String route_thumb) {
		this.route_thumb = route_thumb;
	}
	public Date getRoute_date() {
		return route_date;
	}
	public void setRoute_date(Date route_date) {
		this.route_date = route_date;
	}
	public int getRoute_views() {
		return route_views;
	}
	public void setRoute_views(int route_views) {
		this.route_views = route_views;
	}
	public int getRoute_likes() {
		return route_likes;
	}
	public void setRoute_likes(int route_likes) {
		this.route_likes = route_likes;
	}
	public String getRoute_content() {
		return route_content;
	}
	public void setRoute_content(String route_content) {
		this.route_content = route_content;
	}
	public String getRoute_mapinfo() {
		return route_mapinfo;
	}
	public void setRoute_mapinfo(String route_mapinfo) {
		this.route_mapinfo = route_mapinfo;
	}
	public String getRoute_area() {
		return route_area;
	}
	public void setRoute_area(String route_area) {
		this.route_area = route_area;
	}
	public double getRoute_distance() {
		return route_distance;
	}
	public void setRoute_distance(double route_distance) {
		this.route_distance = route_distance;
	}
	public boolean isWarning() {
		return warning;
	}
	public void setWarning(boolean warning) {
		this.warning = warning;
	}
	
}
