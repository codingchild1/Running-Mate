package com.mulcam.run.service;

import java.util.List;

import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.dto.Route;
import com.mulcam.run.dto.RouteInfo;

public interface RouteService {
	
	public void regRoute(Route route) throws Exception;
	public List<RouteInfo> getRoutesList(int page, PageInfo pageInfo) throws Exception;
	public RouteInfo getRouteInfo(int articleNo) throws Exception;
	public List<RouteInfo> getSortedRoutes(String area, int distance_left, int distance_right, int page, PageInfo pageInfo) throws Exception;
	
	public void updateRoutePostView(int articleNO) throws Exception;
	public void updateRoutePost(Route route) throws Exception;
	public void LikesPlus(int articleNo) throws Exception;
	public void LikesMinus(int articleNo) throws Exception;
	public void removeRouteBoard(int articleNo) throws Exception;
	
	void routeWarning(int articleNo)throws Exception; 
	void routeWarningDelete(int articleNo)throws Exception;
	
	//내가 쓴 글 route
	public List<Route> routeList(String id); 
}
