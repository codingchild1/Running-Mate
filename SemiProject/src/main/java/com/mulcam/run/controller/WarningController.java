package com.mulcam.run.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.run.dto.Warning;
import com.mulcam.run.service.WarningService;

@Controller
public class WarningController {
	@Autowired
	WarningService warningService;
	
	@GetMapping(value="warninglist")
	public ModelAndView warnlist() {
		ModelAndView mav = new ModelAndView("warning_list");
		try {
			List<Warning> warninglist = warningService.AllWarninglist();
			mav.addObject("list", warninglist);
			mav.addObject("cpage", "warning_list");
		} catch(Exception e) {
			mav.addObject("err", e.getMessage());
			mav.addObject("cpage", "err");
		}
		return mav;
	}
}
