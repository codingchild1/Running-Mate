package com.mulcam.run.service;

import java.util.List;

import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.dto.Today;

public interface TodayService {

//신고
//회원id 가져오기

	Today getTBoard(int articleNo) throws Exception; 
	List<Today> getTBoardList(int page, PageInfo pageInfo) throws Exception;
	List<Today> getSearchBoardList(String search, int page, PageInfo pageInfo) throws Exception; 
	void setInputList(Today tboard) throws Exception; 
	void modifyBoard(Today tboard) throws Exception; 
	void removeTBoard(int articleNo) throws Exception;
	void inputWarn(boolean a) throws Exception;
	public void LikesPlus(int articleNo) throws Exception; 
	public void LikesMinus(int articleNo) throws Exception; 
//	public void AlertPlus(int articleNo) throws Exception; 
//	public void AlertMinus(int articleNo) throws Exception;
	

}
