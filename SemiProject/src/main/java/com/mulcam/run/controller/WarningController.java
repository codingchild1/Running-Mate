package com.mulcam.run.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mulcam.run.dto.GroupAndMate;
import com.mulcam.run.dto.Warning;
import com.mulcam.run.service.MateService;
import com.mulcam.run.service.WarningService;

@Controller
public class WarningController {
	@Autowired
	WarningService warningService;
	
	@Autowired
	MateService mateService;
	
	
	@RequestMapping(value="/warningdelete", method={RequestMethod.GET, RequestMethod.POST})
	public String deletewarning(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size;i++) {
			warningService.delete(ajaxMsg[i]);
		}
		return "redirect:warninglist";
	}
	
	@RequestMapping(value="/warninglist", method= {RequestMethod.GET, RequestMethod.POST})
	public String todayList(Model model) {
		try {
			List<Warning> warninglist = warningService.AllWarninglist();
			model.addAttribute("warninglist", warninglist);
			List<GroupAndMate> matelist = mateService.mateList2();
			model.addAttribute("matelist", matelist);
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("warninglist", null);
		}
		return "warninglist";
	}
	
}
