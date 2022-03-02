package com.mulcam.run.dto;

public class Warning {
	int alert_no;
	String board_type;
	int board_no;
	int comment_ref;
	int comment_seq;
	int alert_cnt;
	String alert_id;
	
	public Warning(){}
	public Warning(int alert_no,String board_type,int board_no,int comment_ref, int comment_seq, int alert_cnt, String alert_id) {
		this.alert_no=alert_no;
		this.board_type=board_type;
		this.board_no=board_no;
		this.comment_ref=comment_ref;
		this.comment_seq=comment_seq;
		this.alert_cnt=alert_cnt;
		this.alert_id=alert_id;
	}
	public int getAlert_no() {
		return alert_no;
	}
	public void setAlert_no(int alert_no) {
		this.alert_no = alert_no;
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
	public int getComment_ref() {
		return comment_ref;
	}
	public void setComment_ref(int comment_ref) {
		this.comment_ref = comment_ref;
	}
	public int getComment_seq() {
		return comment_seq;
	}
	public void setComment_seq(int comment_seq) {
		this.comment_seq = comment_seq;
	}
	public int getAlert_cnt() {
		return alert_cnt;
	}
	public void setAlert_cnt(int alert_cnt) {
		this.alert_cnt = alert_cnt;
	}
	public String getAlert_id() {
		return alert_id;
	}
	public void setAlert_id(String alert_id) {
		this.alert_id = alert_id;
	}
}
