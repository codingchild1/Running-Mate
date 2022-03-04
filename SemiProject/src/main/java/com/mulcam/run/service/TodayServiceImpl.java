package com.mulcam.run.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.TodayDAO;
import com.mulcam.run.dto.Today;


@Service
public class TodayServiceImpl implements TodayService {
	@Autowired 
	TodayDAO todayDAO; 
	
	@Override
	public List<Today> getSerchBoardList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Today> getSelectBoard() throws Exception {
		//하나의 게시글 선택해서 가져오기
		//return todayDAO.selectTBoardList();
		
		//return todayDAO.selectTBoard(today_articleNo);
		return null;
	}

	@Override
	public void setInputList(Today tboard) throws Exception {
		// tboard에 작성된 제목과 내용을 가지고 dB에 넣기 
		todayDAO.insertTBoard(tboard);
	}

	@Override
	public void modifyBoard(Today tboard) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void removeBoard(Today tboard) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void inputWarn(boolean a) throws Exception {
		// TODO Auto-generated method stub
		
	}

}