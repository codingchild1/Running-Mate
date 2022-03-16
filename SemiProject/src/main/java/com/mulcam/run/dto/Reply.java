package com.mulcam.run.dto;

import java.sql.Date;

public class Reply {
	int reply_no;
	String board_type;
	int board_no;
	String reply_id;
	String user_img;
	Date reply_date;
	String reply_content;
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getBoard_type() {
		return board_type;
	}
	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getReply_id() {
		return reply_id;
	}
	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	public Date getReply_date() {
		return reply_date;
	}
	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	
	/*
	 * 
	 * reply_no int(11) auto_increment,
    board_type varchar(100) not null,
	board_no int(11) not null,
    reply_id varchar(100) not null,
    user_img varchar(500) not null,
	reply_date datetime default current_timestamp,
    reply_content longtext,
	 */
}
