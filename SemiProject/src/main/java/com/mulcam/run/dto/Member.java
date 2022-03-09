package com.mulcam.run.dto;

import java.sql.Date;

public class Member { 
	String id;
	String name;
	String password;
	String email;
	String phone;
	Date joindate;
	String memberthumb;
	
	public Member() {}
	public Member(String id, String name, String password, String email, String phone, String memberthumb) {
		this.id=id;
		this.name=name;
		this.password=password;
		this.email=email;
		this.phone=phone;
		this.memberthumb=memberthumb;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public String getMemberthumb() {
		return memberthumb;
	}
	public void setMemberthumb(String memberthumb) {
		this.memberthumb = memberthumb;
	}
	
	
}