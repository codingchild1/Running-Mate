package com.mulcam.run.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.TodayDAO;
import com.mulcam.run.dto.PageInfo;
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
	
	
	//전체 게시글 
	@Override
	public List<Today> getTBoardList(int page, PageInfo pageInfo) throws Exception {
		//table에 있는 모든 row 개수
		int listCount=todayDAO.selectTBoardCount();
		
		//그 개수를 5으로 나누고 올림처리하여 페이지 수 계산
		int maxPage=(int)Math.ceil((double)listCount/5);
		
		//아래 2개의 알고리즘은 현재 하나의 페이지에 글 목록을 6개 보여주고
		//아래에 페이지 이동 버튼도 5개로 구성하고자 하기 위함이다.
		int startPage=(((int) ((double)page/6+0.9))-1)*6+1;
		int endPage=startPage+5-1;
		
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		
		int startrow=(page-1)*5+1;
		
		return todayDAO.selectTBoardList(startrow);
	}



	//하나의 게시글 선택해서 가져오기
	@Override
	public Today getTBoard(int today_articleNo) throws Exception {
		todayDAO.updateReadCount(today_articleNo);
		//사용자가 게시판 목록에서 글 상세보기를 눌렀기 때문에 조회수를 1 늘려주는 쿼리문을 수행한 후에
		//해당 글의 DB정보를 select 해온다.
		return todayDAO.selectTBoard(today_articleNo);
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