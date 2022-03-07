package com.mulcam.run.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Board;

@Mapper
@Repository
public interface BoardDAO {
	List<Board> selectBoardList(int startrow) throws Exception; // 게시글 목록 불러오기
	int selectBoardCount() throws Exception;
	
	public Board selectBoard(int fb_no) throws Exception;  // 게시물 상세보기
	public void insertBoard(Board board) throws Exception; // 게시글 작성
	public void updateFbViews(int fb_no) throws Exception; // 조회수
	public void deleteBoard(int fb_no) throws Exception; // 게시글 삭제
	public void updateBoard(int fb_no) throws Exception; // 게시글 수정
	
}