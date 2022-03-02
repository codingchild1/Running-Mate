package com.mulcam.run.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mulcam.run.dto.Route;
import com.mulcam.run.service.RouteService;


@Controller
public class RouteController {
	
	@Autowired
	RouteService routeService;

	@GetMapping("/route")
	public String routemain() {
		return "route_main";
	}
	@GetMapping("/route_sort")
	public String route_sort() {
		return "route_sort";
	}
	
	@PostMapping("/route")
	public String route_main() {
		return "route_main";
	}
	
	@PostMapping("/route_sort")
	public String routesort() { 
		return "route_sort";
	}
	
	@PostMapping("/route_post")
	public String routepost() { 
		return "route_post";
	}
	
	@PostMapping("/route_write")
	public String routewrite() { 
		return "route_write";
	}
	
	@PostMapping(value="/route_reg")
	//@ModelAttribute은 class로 받아올 수 있음!
	public void registerRoute(Route route) {
		
		try {
//			Date date_now = new Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
//			route.setUser_id("홍길동");
//			route.setRoute_thumb("http://www.apparelnews.co.kr/upfiles/manage/202010/fec559517a1bd71b6ffc3d4428401c07.jpg");
//			route.setRoute_date(date_now);
//			route.setRoute_views(0);
//			route.setRoute_likes(0);
//			String str = "{33.450701, 126.570667}";
//			route.setRoute_mapinfo(str);
//			route.setWarning(false);
			routeService.regRoute(route);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(route.getUser_id());
		System.out.println(route.getRoute_title());
	}

}
