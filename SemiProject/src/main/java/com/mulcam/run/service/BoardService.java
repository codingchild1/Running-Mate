package com.mulcam.run.service;

import java.util.List;

import com.mulcam.run.dto.Board;
import com.mulcam.run.dto.GroupAndMate;
import com.mulcam.run.dto.Mate;
import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.dto.Today;

public interface BoardService {
	List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception; // 게시글 목록 불러오기
	Board getBoard(int fb_articleNo) throws Exception;							// 게시물 상세보기
	void removeBoard(int fb_articleNo) throws Exception;					// 삭제
	

	void insertContent(Board board) throws Exception;	//글 작성
	
	Board getContBoard(Board board) throws Exception;	//카운트
	
	
	void modifyBoard(Board board) throws Exception; // 수정
	
												//검색
	
	List<Today> best3() throws Exception; // 최고의 러너
	List<GroupAndMate> mate3() throws Exception; // 번개런
	
	public void LikesPlus5(int fb_articleNo) throws Exception;
	public void LikesMinus5(int fb_articleNo) throws Exception;
}
