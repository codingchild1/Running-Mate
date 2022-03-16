package com.mulcam.run.dto;

public class ReplyInfo {
	int reply_no;
	String board_type;
	int board_no;
	String reply_content;
	
	public ReplyInfo(int reply_no, String reply_content) {
		this.reply_no = reply_no;
		this.reply_content = reply_content;
	}
	public ReplyInfo(String board_type, int board_no){
		this.board_type = board_type;
		this.board_no = board_no;
	}
	
	
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
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	
	
}
