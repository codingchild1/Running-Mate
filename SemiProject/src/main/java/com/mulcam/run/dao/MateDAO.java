package com.mulcam.run.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Alert;
import com.mulcam.run.dto.Group;
import com.mulcam.run.dto.GroupAndMate;
import com.mulcam.run.dto.Mate;
import com.mulcam.run.dto.Ptp;
import com.mulcam.run.dto.Warning;

@Mapper
@Repository
public interface MateDAO {
	
	public List<GroupAndMate> postList() throws Exception;  //전체 게시물
	
	public List<Mate> mateList() throws Exception;  //번개 전체조회
	public List<Group> groupList() throws Exception; //소모임 전체조회
	
	public Mate queryMate(int mate_articleNO) throws Exception; //번개 조회,정보
	public Group queryGroup(int group_articleNO) throws Exception; //소모임 조회,정보
	
	public void updateMate(Mate mate)throws Exception;  //번개 글,내용수정
	public void updateGroup(Group group)throws Exception; //소모임 글,내용수정
	
	public void deleteMate(int mate_articleNO) throws Exception;  //번개 삭제
	public void deleteGroup(int group_articleNO) throws Exception; //소모임 삭제
	
	public void insertMate(Mate mate)throws Exception; //번개 생성
	public void insertGroup(Group group)throws Exception;  //소모임 생성
	
	public void mateWarning(int mate_articleNO)throws Exception; //번개신고 접수
	public void groupWarning(int group_articleNO)throws Exception; //소모임신고 접수
	
	void mateWarningCanc(int mate_articleNO)throws Exception; //번개신고 접수
	void groupWarningCanc(int group_articleNO)throws Exception; //소모임신고 접수
	
	public void like(int mate_articleNO)throws Exception; //번개참여(참여자수 +1)
	public void likeCancel(int mate_articleNO)throws Exception; //번개참여취소(참여자수 -1)
	
	public void insertptp(Map map)throws Exception; //번개참여시 ptp테이블에 아이디값 저장
	public void deleteptp(Map map)throws Exception; //번개참여취소시 ptp테이블에 아이디값 삭제
	
	public List<Ptp> ptpInfo(int mate_articleNO)throws Exception; //참여자 조회 (매개변수 나중에 다시 생각)
	public Ptp ptpInfo2(Map map)throws Exception; //참여자 조회 (매개변수 나중에 다시 생각)
	
	public boolean checkPtp(Ptp ptp) throws Exception; //참여여부 확인
	
	public List<GroupAndMate> searchList(Map map) throws Exception; //게시물 검색
	public List<GroupAndMate> searchListAll(Map map) throws Exception; //게시물 검색2
	
	public List<String> searchmapInfo() throws Exception; //전체게시물의 맵정보만 조회
	public List<String> searchtitleInfo() throws Exception; //전체게시물의 맵정보만 조회
	
	public List<GroupAndMate> searchMap(String input)throws Exception; //map페이지 주소검색
	public List<GroupAndMate> searchMap2(Map map)throws Exception; //map페이지 주소검색
	public List<GroupAndMate> searchMap3(String type)throws Exception; //map페이지 주소검색

	//내가 쓴 글
	public List<GroupAndMate> matewrite(String id);
}
