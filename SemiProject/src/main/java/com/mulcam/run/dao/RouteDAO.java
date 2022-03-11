package com.mulcam.run.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Route;
import com.mulcam.run.dto.RouteInfo;
import com.mulcam.run.dto.SearchRoute;

@Mapper
@Repository("routeDAO")
public interface RouteDAO {
	public int selectRouteCount() throws Exception;
	public List<RouteInfo> selectRouteList(int startrow) throws Exception; 	//select 전체 코스 게시물
	public RouteInfo queryRoute(int articleNo);								//select  코스 게시물
	
	public List<Route> queryByAreaNDistance(SearchRoute search) throws Exception;
	public List<Route> queryByDistance(SearchRoute search) throws Exception;
	public List<Route> queryByArea(SearchRoute search) throws Exception;
	
	public void updateViews(int articleNo);				//update 조회수
	public void updateLikePlus(int articleNo);
	public void updateLikeMinus(int articleNo);
	
	//public List<Route> selectRoute();			//select 코스 게시물 list 기준 by 지역 & 거리
	//public void updateViews();				//update 조회수
	//public List<Route> selectBest3();			//select 기준 = 내 위치 orderby 3
	public void insertRoute(Route route);		//insert 코스
	public void updateRoute(Route route);		//update 코스
	public void deleteRoute(int articleNo);					//delete 코스
}
