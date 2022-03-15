package com.mulcam.run.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.MemberDAO;
import com.mulcam.run.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;

	@Override
	public boolean memOverlap(String id) throws Exception {
		Member mem=memberDAO.queryMember(id);
		if(mem==null) return false;
		return true;
	}

	@Override
	public void makeMember(Member mem) throws Exception {
		memberDAO.insertMember(mem);
	}

	@Override
	public boolean accessMember(String id, String password) throws Exception {
		Member mem=memberDAO.queryMember(id);
		if(id.equals(mem.getId())&&password.equals(mem.getPassword())) {
			return true;
		} else if(id.equals(mem.getId())&&!password.equals(mem.getPassword())) {
			throw new Exception("비밀번호가 일치하지 않습니다");
		} else return false;
	}

	@Override
	public List<Member> memberList() {
		return memberDAO.memberList();
	}
	
	//
	@Override
	public Member queryById(String id) throws Exception {
		return memberDAO.queryMember(id);
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		memberDAO.delete(id);
	}


	@Override
	public void updateMember(Member mem) {
		// TODO Auto-generated method stub
		memberDAO.updateMember(mem);
	}

	@Override
	public String checkPw(String id) {
		// TODO Auto-generated method stub
		return memberDAO.queryPassword(id);
	}
	

	@Override
	public void modifyPw(Member mem) {
		// TODO Auto-generated method stub
		memberDAO.changePw(mem);
		
	}
	
	@Override
	public String profileImg(String user_id) throws Exception {
		return memberDAO.queryProfile(user_id);
	}

	@Override
	public Member getAdminCK(String id) {
		// TODO Auto-generated method stub
		return memberDAO.getAdminCK(id);
	}

}
