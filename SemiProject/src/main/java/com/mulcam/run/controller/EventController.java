//package com.mulcam.run.controller;
//
//import java.util.List;
//
//import javax.servlet.ServletContext;
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//
//
//import com.mulcam.run.service.MemberService;
//
//@Controller
//public class EventController {
//	@Autowired
//	MemberService memberService;
//	
//	@Autowired
//	HttpSession session;
//	
//	@Autowired
//	private ServletContext servletContext;
//		
//	@GetMapping("/event_main")
//	public String event_main() {
//	System.out.println("들어옴");
//		/*
//		 * ModelAndView mav = new ModelAndView("event_main"); PageInfo pageInfo=new
//		 * PageInfo(); try { List<Event> eventList=eventService.getEventList(page,
//		 * pageInfo); mav.addObject("pageInfo", pageInfo); mav.addObject("eventList",
//		 * eventList); mav.setViewName("event_main"); } catch (Exception e) {
//		 * e.printStackTrace(); mav.addObject("err", e.getMessage());
//		 * mav.setViewName("err"); }
//		 */
//		return "event_main";
//	}
//
//}
