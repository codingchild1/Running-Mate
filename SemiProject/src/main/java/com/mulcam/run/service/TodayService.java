package com.mulcam.run.service;

import java.util.List;

import com.mulcam.run.dto.Today;

public interface TodayService {
	//1.전체페이지 검색정보(search)
	//2.전체페이지 게시물글조회(query)
	//3.삽입 (insert)
	//4.수정 (update) 
	//5.삭제 (delete)
	//6.신고 (insert warn) 
		
	List<Today> getSerchBoardList() throws Exception; 
	List<Today> getSelectBoard() throws Exception; 
	void setInputList(Today tboard) throws Exception; 
	void modifyBoard(Today tboard) throws Exception; 
	void removeBoard(Today tboard) throws Exception;
	void inputWarn(boolean a) throws Exception;

}
