package com.mulcam.run.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.RouteDAO;
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
	public List<Route> getSortedRoutes(String area, int distance_left, int distance_right) throws Exception {
		List<Route> sortedRouteLists = null;
		SearchRoute search = new SearchRoute(area, distance_left, distance_right);
		if(area=="" && distance_right!=0) {
			sortedRouteLists = routeDAO.queryByDistance(search);
		} else if(area!=null && distance_left==0 && distance_right==0) {
			sortedRouteLists = routeDAO.queryByArea(search);
		} else {
			sortedRouteLists = routeDAO.queryByAreaNDistance(search);
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
	}

	@Override
	public void LikesPlus(int articleNo) throws Exception {
		routeDAO.updateLikePlus(articleNo);
	}

	@Override
	public void LikesMinus(int articleNo) throws Exception {
		routeDAO.updateLikeMinus(articleNo);
	}
	
}
