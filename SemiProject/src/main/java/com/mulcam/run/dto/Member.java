package com.mulcam.run.dto;

public class Member { //dto 변경
	int articleNO;
	String id;
	String name;
	String password;
	String email;
	String phone;
	public Member() {}
	public Member(String id, String name, String password, String email, 
			String phone, int articleNO) {
		this.articleNO=articleNO;
		this.id=id;
		this.name=name;
		this.password=password;
		this.email=email;
		this.phone=phone;
	}
	public int getArticleNO() {
		return articleNO;
	}
	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
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
	
	

	
}
