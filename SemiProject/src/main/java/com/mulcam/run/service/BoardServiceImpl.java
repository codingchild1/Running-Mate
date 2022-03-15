package com.mulcam.run.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.BoardDAO;
import com.mulcam.run.dto.Board;
import com.mulcam.run.dto.GroupAndMate;
import com.mulcam.run.dto.MyBoard;
import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.dto.Today;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardDAO boardDAO;

	@Override
	public List<Board> getBoardSearchResultList(String column, String keyword, int page, PageInfo pageInfo) throws Exception {
		Map<String, Object> mapParam = new HashMap<String, Object>();
		mapParam.put("keyword", keyword);
		mapParam.put("column", column);
		
		int listCount = boardDAO.selectBoardSearchResultCount(mapParam);
		//총 페이지 수. 올림처리
		int maxPage = (int)Math.ceil((double)listCount/10);
		//현재 페이지에 보여줄 시작 페이지 수(1,11,21...)
		int startPage=(((int) ((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30,...)
//			ex) 35페이지 -> 35/10 = 3.5 -> +0.9 = 4.4 -1 = 3.4 여기서 int 하면 = 3 -> 3*10+1 = 31 
		int endPage=startPage+10-1;
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		int startrow = (page-1)*10+1;
		
		
		mapParam.put("startrow", startrow);
		return boardDAO.selectBoardSearchResultList(mapParam);
	}
	
	@Override
	public List<Board> getBoardList(int page, PageInfo pageInfo) throws Exception {
		int listCount = boardDAO.selectBoardCount();
		//총 페이지 수. 올림처리
		int maxPage = (int)Math.ceil((double)listCount/10);
		//현재 페이지에 보여줄 시작 페이지 수(1,11,21...)
		int startPage=(((int) ((double)page/10+0.9))-1)*10+1;
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30,...)
//	ex) 35페이지 -> 35/10 = 3.5 -> +0.9 = 4.4 -1 = 3.4 여기서 int 하면 = 3 -> 3*10+1 = 31 
		int endPage=startPage+10-1;
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		int startrow = (page-1)*10+1;
		return boardDAO.selectBoardList(startrow);
	}

	/* 게시글 상세 보기 */
	@Override
	public Board getBoard(int fb_articleNo) throws Exception {
		boardDAO.updateReadCount(fb_articleNo);
		return boardDAO.selectBoard(fb_articleNo);
	}

	/* 게시글 삭제 */
	@Override
	public void removeBoard(int fb_articleNo) throws Exception {

			boardDAO.deleteBoard(fb_articleNo);
		}
		


	
	@Override
	public void modifyBoard(Board board) throws Exception {
		boardDAO.updateBoard(board);
		
	}
	
	

	@Override
	public Board getContBoard(Board board) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}




	@Override
	public void insertContent(Board board) throws Exception {
		boardDAO.insertBoard(board);
	}

	/* 최고의 러너 */
	@Override
	public List<Today> best3() throws Exception {

		return boardDAO.bestrun();
	}
	
	/* 메인페이지 번개 모임 */
	@Override
	public List<GroupAndMate> mate3() throws Exception {

		return boardDAO.materun();
	}
	
	@Override
	public void LikesPlus5(int fb_articleNo) throws Exception {
		boardDAO.updateLikePlus5(fb_articleNo);
		
	}

	@Override
	public void LikesMinus5(int fb_articleNo) throws Exception {
		boardDAO.updateLikeMinus5(fb_articleNo);
		
	}
	
	//내가 쓴 글
	@Override
	public List<Board> fbList(String id, int page, PageInfo pageInfo) throws Exception {
		int listCount = boardDAO.fbListCount(id);
		int maxPage = (int)Math.ceil((double)listCount/10);
		int startPage=(((int) ((double)page/10+0.9))-1)*10+1;
		int endPage=startPage+10-1;
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		int startrow = (page-1)*10;
		MyBoard mypageinfo = new MyBoard(id, startrow);
		return boardDAO.fbList(mypageinfo);
	}

	
}
