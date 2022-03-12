package com.mulcam.run.service;

import java.util.List;

import com.mulcam.run.dto.Member;

public interface MemberService {
	boolean memOverlap(String id) throws Exception;
	void makeMember(Member mem) throws Exception;
	boolean accessMember(String id, String password) throws Exception;
	public List<Member> memberList();
	Member queryById(String id) throws Exception;
	public void delete(String id);
	
	//사용자 profile 이미지 정보
	String profileImg(String user_id) throws Exception;
}