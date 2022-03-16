package com.mulcam.run.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.MyBoard;
import com.mulcam.run.dto.Route;
import com.mulcam.run.dto.RouteInfo;
import com.mulcam.run.dto.SearchRoute;

@Mapper
@Repository("routeDAO")
public interface RouteDAO {
	public int selectRouteCount() throws Exception;
	public List<RouteInfo> selectRouteList(int startrow) throws Exception; 	//select 전체 코스 게시물
	public RouteInfo queryRoute(int articleNo);								//select  코스 게시물
	
	public List<RouteInfo> queryByAreaNDistance(SearchRoute sr) throws Exception;
	public List<RouteInfo> queryByDistance(SearchRoute sr) throws Exception;
	public List<RouteInfo> queryByArea(SearchRoute sr) throws Exception;
	public int countByAreaNDistance(SearchRoute sr) throws Exception;
	public int countByDistance(SearchRoute sr) throws Exception;
	public int countByArea(SearchRoute sr) throws Exception;
	
	public void updateViews(int articleNo);				//update 조회수
	public void updateLikePlus(int articleNo);
	public void updateLikeMinus(int articleNo);
	
	// warning update
	public void routeWarning(int route_articleNo) throws Exception; 
	public void routeWarningDelete(int route_articleNo) throws Exception; 

	//public List<Route> selectRoute();			//select 코스 게시물 list 기준 by 지역 & 거리
	//public void updateViews();				//update 조회수
	//public List<Route> selectBest3();			//select 기준 = 내 위치 orderby 3
	public void insertRoute(Route route);		//insert 코스
	public void updateRoute(Route route);		//update 코스
	public void deleteRoute(int articleNo);					//delete 코스
	public void deleteRoute2(int articleNo);						//좋아요 삭제
	//내가 쓴 글 route
	public int routeListCount(String id);
	public List<Route> routeList(MyBoard boardinfo);
}
