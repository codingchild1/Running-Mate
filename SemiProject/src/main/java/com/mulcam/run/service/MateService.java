package com.mulcam.run.service;

import java.util.List;
import java.util.Map;

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
	
	void updateMate(Mate mate) throws Exception; //번개 게시물 수정
	void updateGroup(Group group) throws Exception;// 소모임 게시물 수정
	
	void removeMate(int mate_articleNO) throws Exception; //번개 게시물 삭제
	void removeGroup(int group_articleNO) throws Exception; //소모임 게시물 삭제
	
	int viewsMate(int mate_articleNO)throws Exception; //번개 글 삭제시 조회수 -1변경
	int viewsGroup(int group_articleNO)throws Exception; //번개 글 삭제시 조회수 -1변경
	
	void makeMate(Mate mate)throws Exception; //번개 게시물 생성
	void makeGroup(Group group)throws Exception; //소모임 게시물 생성
	
	void mateWarning(int mate_articleNO)throws Exception; //번개신고 접수
	void groupWarning(int group_articleNO)throws Exception; //소모임신고 접수
	
	void mateWarningCanc(int mate_articleNO)throws Exception; //번개신고 접수
	void groupWarningCanc(int group_articleNO)throws Exception; //소모임신고 접수
	
	void like(int mate_articleNO) throws Exception; //참여버튼(참여자 수 +1)
	void likeCancel(int mate_articleNO) throws Exception; //참여버튼(참여자 수 +1)
	
	List<Ptp> ptpInfo(int mate_articleNO) throws Exception; //참여자 조회
	public boolean checkptp(String user_id, int mate_articleNO) throws Exception;

	void makePtp(int mate_articleNO, String user_id)throws Exception; //참여자리스트에 추가
	void deletePtp(int mate_articleNO, String user_id)throws Exception; //참여자리스트에 제거

	Boolean likequery(int mate_articleNO, String user_id)throws Exception; //참여자여부 확인
	
	List<GroupAndMate> searchInfo(String type, String option, String input)throws Exception; //검색
	List<GroupAndMate> searchInfoAll(String option, String input)throws Exception; //검색2
	
	List<String> allMapInfo() throws Exception; //전체 게시물 조회
	List<String> allTitleInfo() throws Exception; //전체 게시물 조회
	
	List<GroupAndMate> addressinfo(String input) throws Exception; //map페이지 주소검색
	List<GroupAndMate> addressinfo2(String type,String input) throws Exception; //map페이지 주소검색
	List<GroupAndMate> addressinfo3(String type) throws Exception; //map페이지 주소검색
}
