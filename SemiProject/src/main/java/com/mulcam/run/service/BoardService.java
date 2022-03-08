package com.mulcam.run.service;

import java.util.List;

import com.mulcam.run.dto.Board;
import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.dto.Today;

public interface BoardService {
	List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception; // 게시글 목록 불러오기
	Board getBoard(int fb_articleNo) throws Exception;							// 게시물 상세보기
	void removeBoard(int fb_articleNo) throws Exception;					// 삭제
	

	Board insertContent(Board board) throws Exception;
	Board getContBoard(Board board) throws Exception;
	void modifyBoard(Board board) throws Exception;
	//검색
	
	List<Today> best3() throws Exception; // 최고의 러너
}
