package com.mulcam.run.service;

import java.util.List;

import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.dto.Route;

public interface RouteService {
	
	public Route regRoute(Route route) throws Exception;
	public List<Route> getRoutesList(int page, PageInfo pageInfo) throws Exception;
	public Route getRouteInfo(int articleNo) throws Exception;
}
