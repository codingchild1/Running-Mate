package com.mulcam.run.service;

import java.util.List;

import com.mulcam.run.dto.Group;
import com.mulcam.run.dto.GroupAndMate;
import com.mulcam.run.dto.Mate;
import com.mulcam.run.dto.Ptp;
import com.mulcam.run.dto.Warning;

public interface MateService{
	List<GroupAndMate> allpostInfo() throws Exception; //전체 게시물 조회
	
	List<Mate> allMateInfo() throws Exception; //번개 전체 게시물 조회
	List<Group> allGroupInfo() throws Exception; //소모임 전체 게시물 조회
	
	Mate mateInfo(int mate_articleNO) throws Exception;  //번개 정보 조회
	Group groupInfo(int group_articleNO) throws Exception; //소모임 정보 조회
	
	Mate updateMate(int mate_articleNO) throws Exception; //번개 게시물 수정
	Group updateGroup(int group_articleNO) throws Exception;// 소모임 게시물 수정
	
	Mate removeMate(Mate mate) throws Exception; //번개 게시물 삭제
	Group removeGroup(Group group) throws Exception; //소모임 게시물 삭제
	
	int viewsMate(int mate_articleNO)throws Exception; //번개 글 삭제시 조회수 -1변경
	int viewsGroup(int group_articleNO)throws Exception; //번개 글 삭제시 조회수 -1변경
	
	void makeMate(Mate mate)throws Exception; //번개 게시물 생성
	void makeGroup(Group group)throws Exception; //소모임 게시물 생성
	
	Warning makeWarning(Warning warning)throws Exception; //신고 접수
	void like(int mate_articleNO) throws Exception; //참여버튼(참여자 수 +1)
	void likeCancel(int mate_articleNO) throws Exception; //참여버튼(참여자 수 +1)
	
	String ptpInfo(int mate_articleNO) throws Exception;
	
	void makePtp(Ptp ptp)throws Exception;
	//게시물 검색
}
