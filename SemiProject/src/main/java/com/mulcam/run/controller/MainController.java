package com.mulcam.run.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.run.dto.Mate;
import com.mulcam.run.dto.Today;
import com.mulcam.run.service.BoardService;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	BoardService boardService;
	
	@GetMapping(value="/main")
	public ModelAndView Main() {
		ModelAndView mav = new ModelAndView("main");
		List<Today> TodayBest3;
		List<Mate> RecentMate3;
		try {
			TodayBest3 = boardService.best3();
			mav.addObject("BestList", TodayBest3);
			RecentMate3 = boardService.mate3();
			mav.addObject("MateList", RecentMate3);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

}