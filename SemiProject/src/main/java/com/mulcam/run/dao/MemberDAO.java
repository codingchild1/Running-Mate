package com.mulcam.run.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Member;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {
	public Member queryMember(String id) throws Exception;
	public void insertMember(Member mem) throws Exception;
	public List<Member> memberList();
	public void delete(String id);
	public String pwCheck(String id)throws Exception;
	public void updateMember(Member mem);
	public String queryPassword(String id);
	public void changePw(String newPw);
	
	public String queryProfile(String user_id) throws Exception;
}
