package com.mulcam.run.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.RouteDAO;
import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.dto.Route;

@Service 
public class RouteServiceImpl implements RouteService {

	@Autowired
	RouteDAO routeDAO;
	
	@Override
	public Route regRoute(Route route) throws Exception {
		routeDAO.insertRoute(route);
		return null;
	}

	@Override
	public List<Route> getRoutesList(int page, PageInfo pageInfo) throws Exception {		
		int listCount =  routeDAO.selectRouteCount();
		int maxPage = (int)Math.ceil((double)listCount/9);
		int startPage=(((int) ((double)page/9+0.9))-1)*9+1;
		int endPage=startPage+9-1;
		System.out.println(maxPage +","+startPage+","+endPage);
		
		if(endPage>maxPage) endPage=maxPage;
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setListCount(listCount);
		int startrow = (page-1)*9+1;
		System.out.println(startrow);
		return routeDAO.selectRouteList(startrow);
	}	
	
	@Override
	public Route getRouteInfo(int articleNo) throws Exception{
		return routeDAO.queryRoute(articleNo);
	}

	@Override
	public List<Route> getSortedRoutes(String area, int[] distance) throws Exception {
		List<Route> sortedRouteLists = null;
		if(area!="" && distance[1]!=0) {
			//sortedRouteLists = 
		} else if(distance[1]!=0) {
			sortedRouteLists = routeDAO.queryByDistance(distance);
		}
		return sortedRouteLists;
	}

	@Override
	public void updateRoutePostView(int articleNO) throws Exception {
		routeDAO.updateViews(articleNO);
	}

	@Override
	public void updateRoutePost(Route route) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
}
