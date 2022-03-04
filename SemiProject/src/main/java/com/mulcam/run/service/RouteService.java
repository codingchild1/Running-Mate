package com.mulcam.run.service;

import java.util.List;

import com.mulcam.run.dto.Route;

public interface RouteService {
	
	public Route regRoute(Route route) throws Exception;
	public List<Route> allRoutesList() throws Exception;
}
