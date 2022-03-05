package com.mulcam.run.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Group;
import com.mulcam.run.dto.GroupAndMate;
import com.mulcam.run.dto.Mate;
import com.mulcam.run.dto.Warning;

@Mapper
@Repository
public interface MateDAO {
	public List<GroupAndMate> postList() throws Exception;  //전체 게시물
	
	public List<Mate> mateList() throws Exception;  //번개 전체조회
	public List<Group> groupList() throws Exception; //소모임 전체조회
	
	public Mate queryMate(int mate_articleNO) throws Exception; //번개 조회,정보
	public Group queryGroup(int group_articleNO) throws Exception; //소모임 조회,정보
	
	public void updateMate(int mate_articleNO)throws Exception;  //번개 글,내용수정
	public void updateGroup(int group_articleNO)throws Exception; //소모임 글,내용수정
	
	public void deleteMate(int mate_articleNO) throws Exception;  //번개 삭제
	public void deleteGroup(int group_articleNO) throws Exception; //소모임 삭제
	
	public void updateMateviews(int mate_articleNO) throws Exception; //번개 글 삭제시 조회수 -1변경
	public void updateGroupviews(int group_articleNO) throws Exception; //번개 글 삭제시 조회수 -1변경
	
	public void insertMate(Mate mate)throws Exception; //번개 생성
	public void insertGroup(Group group)throws Exception;  //소모임 생성
	
	public void insertWarning(Warning warning)throws Exception; //신고 접수
	public void ptpInfo(int mate_articleNO)throws Exception; //참여자 조회 (매개변수 나중에 다시 생각)
	public void like()throws Exception; //참여버튼(참여자수 +1)
	
	//게시물 검색
}
