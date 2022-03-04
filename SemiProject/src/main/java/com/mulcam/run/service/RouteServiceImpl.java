package com.mulcam.run.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.RouteDAO;
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
	public List<Route> allRoutesList() throws Exception {
		List<Route> list = routeDAO.routeAllList();
		return list;
	}	
	
	
	
}
