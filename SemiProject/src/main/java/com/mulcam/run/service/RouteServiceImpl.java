package com.mulcam.run.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.RouteDAO;
import com.mulcam.run.dto.MyBoard;
import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.dto.Route;
import com.mulcam.run.dto.RouteInfo;
import com.mulcam.run.dto.SearchRoute;

@Service 
public class RouteServiceImpl implements RouteService {

	@Autowired
	RouteDAO routeDAO;
	
	@Override
	public void regRoute(Route route) throws Exception {
		routeDAO.insertRoute(route);
	}

	@Override
	public List<RouteInfo> getRoutesList(int page, PageInfo pageInfo) throws Exception {		
		int listCount =  routeDAO.selectRouteCount();
		int maxPage = (int)Math.ceil((double)listCount/9);
		int startPage=(((int) ((double)page/9+0.9))-1)*9+1;
		int endPage=startPage+9-1;
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		int startrow = (page-1)*9;
		return routeDAO.selectRouteList(startrow);
	}	
	
	@Override
	public RouteInfo getRouteInfo(int articleNo) throws Exception{
		return routeDAO.queryRoute(articleNo);
	}

	@Override
	public List<RouteInfo> getSortedRoutes(String area, int distance_left, int distance_right, int page, PageInfo pageInfo) throws Exception {
		List<RouteInfo> sortedRouteLists = null;
		int startPage=(((int) ((double)page/6+0.9))-1)*6+1;
		int endPage=startPage+10-1;
		//distance
		if(area=="" && distance_right!=0) {
			SearchRoute sr = new SearchRoute(area, distance_left, distance_right);
			int listCount =  routeDAO.countByDistance(sr);
			int maxPage = (int)Math.ceil((double)listCount/6);
			if(endPage>maxPage) endPage=maxPage;
			
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setListCount(listCount);
			sr.setStartrow((page-1)*6);
			
			sortedRouteLists = routeDAO.queryByDistance(sr);
		}
		//area
		else if(area!=null && distance_left==0 && distance_right==0) {
			SearchRoute sr = new SearchRoute(area, distance_left, distance_right);
			int listCount =  routeDAO.countByArea(sr);
			int maxPage = (int)Math.ceil((double)listCount/6);
			if(endPage>maxPage) endPage=maxPage;
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setListCount(listCount);
			sr.setStartrow((page-1)*6);
			
			sortedRouteLists = routeDAO.queryByArea(sr);
		}
		//distance and area
		else {
			SearchRoute sr = new SearchRoute(area, distance_left, distance_right);
			int listCount =  routeDAO.countByAreaNDistance(sr);
			int maxPage = (int)Math.ceil((double)listCount/6);
			if(endPage>maxPage) endPage=maxPage;
			pageInfo.setStartPage(startPage);
			pageInfo.setEndPage(endPage);
			pageInfo.setMaxPage(maxPage);
			pageInfo.setPage(page);
			pageInfo.setListCount(listCount);
			sr.setStartrow((page-1)*6);
			
			sortedRouteLists = routeDAO.queryByAreaNDistance(sr);
		}
		return sortedRouteLists;
	}
	
	@Override
	public void updateRoutePostView(int articleNO) throws Exception {
		routeDAO.updateViews(articleNO);
	}

	@Override
	public void updateRoutePost(Route route) throws Exception {
		routeDAO.updateRoute(route);
		
	}

	@Override
	public void removeRouteBoard(int articleNo) throws Exception {
		routeDAO.deleteRoute(articleNo);
		routeDAO.deleteRoute2(articleNo); //좋아요 삭제
	}

	@Override
	public void LikesPlus(int articleNo) throws Exception {
		routeDAO.updateLikePlus(articleNo);
	}

	@Override
	public void LikesMinus(int articleNo) throws Exception {
		routeDAO.updateLikeMinus(articleNo);
	}

	@Override
	public void routeWarning(int articleNo) throws Exception {
		routeDAO.routeWarning(articleNo);		
	}

	@Override
	public void routeWarningDelete(int articleNo) throws Exception {
		routeDAO.routeWarningDelete(articleNo);
	}

	//내가 쓴 글 route
	@Override
	public List<Route> routeList(String id, int page, PageInfo pageInfo)  throws Exception{
		int listCount = routeDAO.routeListCount(id);
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
		System.out.println("list : " +listCount);
		
		return routeDAO.routeList(mypageinfo);
	}
	
}
