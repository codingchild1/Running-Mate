package com.mulcam.run.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.TodayDAO;
import com.mulcam.run.dto.MyBoard;
import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.dto.Today;


@Service
public class TodayServiceImpl implements TodayService {
	
	@Autowired 
	TodayDAO todayDAO; 
	
	//전체 게시글 
	@Override
	public List<Today> getTBoardList(int page, PageInfo pageInfo) throws Exception {
		//table에 있는 모든 row 개수
		int listCount=todayDAO.selectTBoardCount();
		
		int maxPage=(int)Math.ceil((double)listCount/6);
		int startPage=(((int) ((double)page/6+0.9))-1)*6+1;
		int endPage=startPage+10-1;
		System.out.println(maxPage +","+startPage+","+endPage);
		if(endPage>maxPage) {
			endPage=maxPage;
		}
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		
		int startrow=(page-1)*6;
		
		return todayDAO.selectTBoardList(startrow);
	}



	//하나의 게시글 선택해서 가져오기
	//사용자가 게시판 목록에서 글 상세보기를 눌렀기 때문에 조회수를 1 늘려주는 쿼리문을 수행한 후에
	//해당 글의 DB정보를 select 해온다.
	@Override
	public Today getTBoard(int articleNo) throws Exception {
		
		return todayDAO.selectTBoard(articleNo);
	}

	@Override
	public void setInputList(Today tboard) throws Exception {
		todayDAO.insertTBoard(tboard);	
	}

	@Override
	public void modifyBoard(Today tboard) throws Exception {
		todayDAO.updateTBoard(tboard);
		
	}

	@Override
	public void removeTBoard(int articleNo) throws Exception {
		todayDAO.deleteTBoard(articleNo);
		
	}
	
	//검색리스트반환
	@Override
	public List<Today> getSearchBoardList(String search, int page, PageInfo pageInfo) throws Exception {
		int listCount=todayDAO.searchTBoardCount(search);
		System.out.println("List카운트:"+listCount);
		int maxPage=(int)Math.ceil((double)listCount/6);
		int startPage=(((int) ((double)page/6+0.9))-1)*6+1;
		int endPage=startPage+10-1;
		System.out.println(maxPage +","+startPage+","+endPage);
		if(endPage>maxPage) {
			endPage=maxPage;
		}
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		
		int startrow=(page-1)*6;
		
		Map<String, Object> searchParam = new HashMap<String, Object>();
		searchParam.put("search", search);
		searchParam.put("startrow", startrow);
		
		
		return todayDAO.selectSerchTBoardList(searchParam);
	}

	@Override
	public void inputWarn(boolean a) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void LikesPlus(int articleNo) throws Exception {
		System.out.println("좋아요 + 들어옴");
		todayDAO.updateLikeAdd(articleNo);
	}

	@Override
	public void LikesMinus(int articleNo) throws Exception {
		System.out.println("좋아요 - 들어옴");
		todayDAO.updateLikeSub(articleNo);
	}


	//내가 쓴 글
	@Override
	public List<Today> todayList(String id, int page, PageInfo pageInfo) throws Exception {
		int listCount = todayDAO.todayListCount(id);
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
		
		return todayDAO.todayList(mypageinfo);
	}



	@Override
	public void updateTodayView(int articleNo) throws Exception {
		todayDAO.updateReadCount(articleNo);
	}
	
	

}