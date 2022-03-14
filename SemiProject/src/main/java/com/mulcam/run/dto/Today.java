package com.mulcam.run.dto;


import java.sql.Date;

public class Today {
	String today_articleNo; 
	String user_id;
	String user_img;
	String today_title; 
	Date today_date; 
	int today_views; 
	int today_likes; 
	String today_thumb;
	String today_contents;
	boolean warning;
	
	public Today() {}

	/*
	 * public Today( String user_id, String today_title, String today_thumb, String
	 * today_contents) { //this.today_articleNo = today_articleNo; this.user_id =
	 * user_id; this.today_title = today_title; //this.today_date = today_date;
	 * //this.today_views = today_views; //this.today_likes = today_likes;
	 * this.today_thumb = today_thumb; this.today_contents = today_contents;
	 * //this.warning = warning; }
	 */
	public Today(String user_id,String user_img, String today_title,String today_thumb, String today_contents) {
		this.user_id = user_id;
		this.user_img = user_img;
		this.today_title = today_title; 
		this.today_thumb = today_thumb; 
		this.today_contents = today_contents; 
		
	}
	
	public Today(String today_title, String today_thumb,int today_likes,String
	 today_contents) {
		this.today_title = today_title; 
		this.today_thumb = today_thumb;
		this.today_likes = today_likes;
		this.today_contents = today_contents; 
	}
	
	
	
	public String getToday_articleNo() {
		return today_articleNo;
	}
	public void setToday_articleNo(String today_articleNo) {
		this.today_articleNo = today_articleNo;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getToday_title() {
		return today_title;
	}
	public void setToday_title(String today_title) {
		this.today_title = today_title;
	}
	public Date getToday_date() {
		return today_date;
	}
	public void setToday_date(Date today_date) {
		this.today_date = today_date;
	}
	public int getToday_views() {
		return today_views;
	}
	public void setToday_views(int today_views) {
		this.today_views = today_views;
	}
	public int getToday_likes() {
		return today_likes;
	}
	public void setToday_likes(int today_likes) {
		this.today_likes = today_likes;
	}
	public String getToday_thumb() {
		return today_thumb;
	}
	public void setToday_thumb(String today_thumb) {
		this.today_thumb = today_thumb;
	}
	public String getToday_contents() {
		return today_contents;
	}
	public void setToday_contents(String today_contents) {
		this.today_contents = today_contents;
	}
	public boolean getWarning() {
		return warning;
	}
	public void setWarning(Boolean warning) {
		this.warning = warning;
	}
	
}
