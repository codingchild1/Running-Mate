package com.mulcam.run.service;

import java.util.List;

import com.mulcam.run.dto.Member;
import com.mulcam.run.dto.Warning;

public interface MemberService {
	//회원 전체
	public List<Member> AllMemberList() throws Exception;
	//회원 로그인
	boolean accessMember(String id, String password) throws Exception;
	//회원가입
	void insertMember(Member mem) throws Exception;
	//아이디 중복
	boolean memOverlap(String id) throws Exception;
	//회원 탈퇴
	void deleteMember(Member mem) throws Exception;
	//회원 수정(전화번호, 주소)
	void updateMember(String phone, String address) throws Exception;
	//회원 비밀번호 수정
	void insertImg(String id, String userimg) throws Exception;
	
	
}

