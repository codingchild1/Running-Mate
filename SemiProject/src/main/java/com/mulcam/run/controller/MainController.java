package com.mulcam.run.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.run.dto.GroupAndMate;
import com.mulcam.run.dto.Today;
import com.mulcam.run.service.BoardService;
import com.mulcam.run.service.MateService;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	BoardService boardService;
	
	@Autowired
	MateService mateService;
	
	@GetMapping(value="/main")
	public ModelAndView Main() throws Exception {
		ModelAndView mav = new ModelAndView("main");
		List<Today> TodayBest3;
		/* List<Mate> RecentMate3; */
		List<GroupAndMate> mates = boardService.mate3();
		
		try {
			TodayBest3 = boardService.best3();
			mav.addObject("BestList", TodayBest3);
			/*
			 * RecentMate3 = boardService.mate3();
			 * mav.addObject("MateList", RecentMate3);
			 */
			mav.addObject("mates", mates);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

}