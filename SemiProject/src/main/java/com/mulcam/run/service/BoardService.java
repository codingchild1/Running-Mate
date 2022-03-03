package com.mulcam.run.service;

import java.util.List;

import com.mulcam.run.dto.Board;
import com.mulcam.run.dto.PageInfo;

public interface BoardService {
	List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception; // 게시글 목록 불러오기
	Board getBoard(int fb_no) throws Exception;
	Board insertContent(Board board) throws Exception;
	Board getContBoard(Board board) throws Exception;
	void removeBoard(int fb_no) throws Exception;
	void modifyBoard(Board board) throws Exception;
	//검색
}
