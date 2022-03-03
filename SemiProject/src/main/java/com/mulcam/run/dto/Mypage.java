package com.mulcam.run.dto;

public class Mypage {
//글번호, 게시판 타입 제목
	int fb_articleNo;
	int today_articleNo;
	String fb_title;
	String today_title;
	public int getFb_articleNo() {
		return fb_articleNo;
	}
	public void setFb_articleNo(int fb_articleNo) {
		this.fb_articleNo = fb_articleNo;
	}
	public int getToday_articleNo() {
		return today_articleNo;
	}
	public void setToday_articleNo(int today_articleNo) {
		this.today_articleNo = today_articleNo;
	}
	public String getFb_title() {
		return fb_title;
	}
	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
	}
	public String getToday_title() {
		return today_title;
	}
	public void setToday_title(String today_title) {
		this.today_title = today_title;
	}
	
}
