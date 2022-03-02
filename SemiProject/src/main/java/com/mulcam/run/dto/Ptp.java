package com.mulcam.run.dto;

public class Ptp {
	int ptp_no;
	int mate_articleNO;
	String user_id;

	public Ptp() {
	}
	public Ptp(int ptp_no, int mate_articleNO, String user_id) {
		this.ptp_no = ptp_no;
		this.mate_articleNO = mate_articleNO;
		this.user_id = user_id;
	}
	public int getPtp_no() {
		return ptp_no;
	}
	public void setPtp_no(int ptp_no) {
		this.ptp_no = ptp_no;
	}
	public int getMate_articleNO() {
		return mate_articleNO;
	}
	public void setMate_articleNO(int mate_articleNO) {
		this.mate_articleNO = mate_articleNO;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
}
