package com.mulcam.run.dto;

public class Alert {
	int alert_no;
	String user_id;
	String board_type;
	int board_no;
	
	Alert(){}
	public Alert(String user_id, String board_type, int board_no){
		this.user_id = user_id;
		this.board_type = board_type;
		this.board_no = board_no;
	}
	public Alert(int alert_no, String user_id, String board_type, int board_no){
		this.alert_no = alert_no;
		this.user_id = user_id;
		this.board_type = board_type;
		this.board_no = board_no;
	}
	public int getAlert_no() {
		return alert_no;
	}
	public void setAlert_no(int alert_no) {
		this.alert_no = alert_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	
}
