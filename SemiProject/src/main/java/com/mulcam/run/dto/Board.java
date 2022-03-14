package com.mulcam.run.dto;

import java.sql.Date;

public class Board {
	public int fb_articleNo;
	private String fb_title;
	private String writer;
//	private String board_subject;
	private String fb_content;
	private boolean warning;
	private Date fb_date;
	private int fb_views;
	private String user_img;
	private String keyword;
	private String fb_likes;
	
	public Board() {}
	
	public String getFb_likes() {
		return fb_likes;
	}
	public void setFb_likes(String fb_likes) {
		this.fb_likes = fb_likes;
	}
	public String getFb_title() {
		return fb_title;
	}
	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
//	public String getBoard_subject() {
//		return board_subject;
//	}
//	public void setBoard_subject(String board_subject) {
//		this.board_subject = board_subject;
//	}
	public String getFb_content() {
		return fb_content;
	}
	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}

	public boolean getWarning() {
		return warning;
	}
	public void setWarning(boolean warning) {
		this.warning = warning;
	}
	public Date getFb_date() {
		return fb_date;
	}
	public void setFb_date(Date fb_date) {
		this.fb_date = fb_date;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getFb_articleNo() {
		return fb_articleNo;
	}
	public void setFb_articleNo(int fb_articleNo) {
		this.fb_articleNo = fb_articleNo;
	}
	public int getFb_views() {
		return fb_views;
	}
	public void setFb_views(int fb_views) {
		this.fb_views = fb_views;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	
	
}
