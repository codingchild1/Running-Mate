package com.mulcam.run.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Board;
import com.mulcam.run.dto.Mate;
import com.mulcam.run.dto.Today;

@Mapper
@Repository
public interface BoardDAO {
	List<Board> selectBoardList(int startrow) throws Exception; // 게시글 목록 불러오기
	int selectBoardCount() throws Exception;					// 리스트페이징?
	Board selectBoard(int fb_articleNo) throws Exception;			// 상세페이지
	void updateReadCount(int fb_views) throws Exception;		// 조회수
	void deleteBoard(int fb_articleNo) throws Exception;	//삭제
	List<Today> bestrun() throws Exception;			// 최고의 러너
	List<Mate> materun() throws Exception;			// 메인페이지 번개 모임
	

	void updateBoard(Board board) throws Exception; // 게시글 수정
	
	
	void insertBoard(Board board) throws Exception; // 작성
}