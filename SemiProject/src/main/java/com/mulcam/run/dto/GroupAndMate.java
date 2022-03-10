package com.mulcam.run.dto;

public class GroupAndMate {
	String no;
	String id;
	String img;
	String title;
	String regdate;
	int likeno;
	String type;
	String cont;
	
	public GroupAndMate()	{}
	public GroupAndMate(String no,String id,String img,String title,String regdate,int likeno,
			String type,String cont) {
		this.no=no;
		this.id=id;
		this.img=img;
		this.title=title;
		this.regdate=regdate;
		this.likeno=likeno;
		this.type=type;
		this.cont=cont;
	}
	
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getLikeno() {
		return likeno;
	}
	public void setLikeno(int likeno) {
		this.likeno = likeno;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}

