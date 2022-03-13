package com.mulcam.run.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Today;


@Mapper
@Repository
public interface TodayDAO {
	//1.today 페이지 전체 게시물 가져오기 
	int selectTBoardCount() throws Exception;
	List<Today> selectTBoardList(int startrow) throws Exception;
	 
	 
	//2.전체페이지 검색후 여러게시물 반환
	int searchTBoardCount(String search) throws Exception;
	List<Today> selectSerchTBoardList(Map<String, Object> searchParam) throws Exception;
	
	
	//3.하나의 글 정보를 select하는 쿼리문
	Today selectTBoard(int today_articleNo) throws Exception;

	
	//4.todayrun 게시글 삽입 (insert)
	void insertTBoard(Today tboard) throws Exception;
	
	//5.todayrun 게시글 수정 (update) 
	public void updateTBoard(Today tboard) throws Exception;
	
	//6. 조회수 변경
	void updateReadCount(int articleNo) throws Exception;

	//7.삭제 (delete)
	public void deleteTBoard(int articleNo) throws Exception;
	
	//8. 좋아요 +/-
	public void updateLikePlus(int articleNo);
	public void updateLikeMinus(int articleNo);

	//7.신고 (insert alert) 
	//public Boolean insertTWarn() throws Exception;
	
}
