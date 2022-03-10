package com.mulcam.run.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Today;


@Mapper
@Repository
public interface TodayDAO {
	//0.today 페이지 전체 게시물 가져오기 
	int selectTBoardCount() throws Exception;
	List<Today> selectTBoardList(int startrow) throws Exception;
	 
	 
	//1.전체페이지 검색후 여러게시물 반환
	//2.하나의 글 정보를 select하는 쿼리문
	Today selectTBoard(int today_articleNo) throws Exception;

	
	//3.todayrun 게시글 삽입 (insert)
	void insertTBoard(Today tboard) throws Exception;
	
	//4.todayrun 게시글 수정 (update) 
	public void updateTBoard(Today tboard) throws Exception;
	
	//5. 조회수 변경
	void updateReadCount(int articleNo) throws Exception;

	//6.삭제 (delete)
	public void deleteTBoard(int articleNo) throws Exception;

	//7.신고 (insert alert) 
	//public Boolean insertTWarn() throws Exception;
	
}
