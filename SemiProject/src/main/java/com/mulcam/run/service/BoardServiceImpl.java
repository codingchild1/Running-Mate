package com.mulcam.run.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.BoardDAO;
import com.mulcam.run.dto.Board;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO boardDAO;

	@Override
	public List<Board> getBoardList(Board board) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board getBoard(int fb_no) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board insertContent(Board board) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board getContBoard(Board board) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void removeBoard(int fb_no) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modifyBoard(Board board) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
}
