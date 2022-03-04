package com.mulcam.run.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.run.dto.Route;
import com.mulcam.run.service.RouteService;


@Controller
public class RouteController {
	
	@Autowired
	RouteService routeService;
	
	@Autowired
	private ServletContext servletContext;	
	
	@GetMapping("/route")
	public ModelAndView get_routemain() {
		ModelAndView mv = new ModelAndView("route_main");
		try {
			//List<Route> routeslist = routeService.allRoutesList();
			//mv.addObject("routes", routeslist);
		}catch(Exception e) {
		}
		return mv;
	}
	
	@PostMapping("/route")
	public ModelAndView post_routemain() {
		ModelAndView mv = new ModelAndView("route_main");
		try {
			//List<Route> routeslist = routeService.allRoutesList();
			//mv.addObject("routes", routeslist);
		}catch(Exception e) {
		}
		return mv;
	}


	@GetMapping("/route_sort")
	public String route_sort() {
		return "route_sort";
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
	public ModelAndView registerRoute(@ModelAttribute Route route, @RequestParam("content") String content) {
		ModelAndView mv = new ModelAndView("route_post");
		try {			
			route.setRoute_content(content.trim());
			System.out.println(route.getRoute_content());
			System.out.println(route.getRoute_content());
			//routeService.regRoute(route);
			mv.addObject("route", route);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
