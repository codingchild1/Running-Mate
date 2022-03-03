package com.mulcam.run.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Member;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {
	//목록
	public List<Member> memberList() throws Exception;
	//입력
	public void insertMember(Member mem);
	//회원 삭제
	public void deleteMember(Member mem);
	
	public Member queryMember(String id);
}
