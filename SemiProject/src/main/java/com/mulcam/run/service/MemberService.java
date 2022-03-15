package com.mulcam.run.service;

import java.util.List;

import com.mulcam.run.dto.Member;

public interface MemberService {
	boolean memOverlap(String id) throws Exception;
	void makeMember(Member mem) throws Exception;
	boolean accessMember(String id, String password) throws Exception;
	public List<Member> memberList();
	public Member queryById(String id) throws Exception;
	public void delete(String id);
	public String checkPw(String id);
	public void updateMember(Member mem);
	public void modifyPw(Member mem);	
	public Member getAdminCK(String id);
	
	//사용자 profile 이미지 정보
	String profileImg(String user_id) throws Exception;


}
