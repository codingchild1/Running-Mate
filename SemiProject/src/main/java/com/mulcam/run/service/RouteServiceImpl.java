package com.mulcam.run.service;

import java.sql.Date;

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
		Date date_now = new Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
//		route.setUser_id("1234");
//		route.setRoute_thumb("http://www.apparelnews.co.kr/upfiles/manage/202010/fec559517a1bd71b6ffc3d4428401c07.jpg");
		route.setRoute_date(date_now);
		route.setRoute_views(0);
		route.setRoute_likes(0);
//		String str = "{33.450701, 126.570667}";
//		route.setRoute_mapinfo(str);
		route.setWarning(false);
		
		routeDAO.insertRoute(route);
		return null;
	}	
	
}
