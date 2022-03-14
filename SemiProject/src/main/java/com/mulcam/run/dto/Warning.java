package com.mulcam.run.dto;

import java.sql.Date;

public class Warning {
	int warningno;
	String boardtype;
	int boardno;
	int warningcnt;
	String warningid;
	Date warningdate;
	
	//전체 생성자
	public Warning() {}
	public Warning(String boardtype, int boardno, String warningid) {
		this.boardtype = boardtype;
		this.boardno = boardno;
		this.warningid = warningid;
	}
	public Warning(int warningno, String boardtype, int boardno, int warningcnt, String warningid,
			Date warningdate) {
		this.warningno=warningno;
		this.boardtype = boardtype;
		this.boardno = boardno;
		this.warningcnt=warningcnt;
		this.warningid = warningid;
		this.warningdate=warningdate;
	}
	
	public int getWarningno() {
		return warningno;
	}
	public void setWarningno(int warningno) {
		this.warningno = warningno;
	}
	public String getBoardtype() {
		return boardtype;
	}
	public void setBoardtype(String boardtype) {
		this.boardtype = boardtype;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public int getWarningcnt() {
		return warningcnt;
	}
	public void setWarningcnt(int warningcnt) {
		this.warningcnt = warningcnt;
	}
	public String getWarningid() {
		return warningid;
	}
	public void setWarningid(String warningid) {
		this.warningid = warningid;
	}
	public Date getWarningdate() {
		return warningdate;
	}
	public void setWarningdate(Date warningdate) {
		this.warningdate = warningdate;
	}
	
	
}