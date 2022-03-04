package com.mulcam.run.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Today;


@Mapper
@Repository
public interface TodayDAO {
	//0.today 페이지 전체 게시물 가져오기 
	
	//1.전체페이지 검색후 여러게시물 반환
	public List<Today> selectTBoardList(String intext) throws Exception;
	
	//2.전체페이지 하나 게시물 선택
	public Today selectTBoard() throws Exception;
	
	//3.todayrun 게시글 삽입 (insert)
	void insertTBoard(Today tboard) throws Exception;
	
	//4.todayrun 게시글 수정 (update) 
	public void updateTBoard(Today tboard) throws Exception;
	
	//5. 조회 udate 조회수 변경
	//public void updateTViews(int today_articleNo) throws Exception;

	//6.삭제 (delete)
	public void deleteTBoard(int tboardNum) throws Exception;


	
	//7.신고 (insert alert) 
	//public Boolean insertTWarn() throws Exception;
	
	//8.게시판 최대 page 수 ???
}

