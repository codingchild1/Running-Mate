package com.mulcam.run.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.run.dto.Mate;
import com.mulcam.run.service.MateService;

@Controller
public class MateController {
	
	@Autowired
	MateService mateService;
	
//	@GetMapping(value="/")
//	public String bankmain(Model model) {
//		model.addAttribute("cpage", "main");
//		return "main2";
//	}
	
	@GetMapping("/mate_main")
	public String mate_main() {
		return "mate_main";
	}
	@GetMapping("/mate_search")
	public String mate_search() {
		return "mate_search";
	}
	@GetMapping("/mate_map")
	public String mate_map() {
		return "mate_map";
	}
	@GetMapping("/mate_makemate")
	public String mate_makemate() {
		return "mate_makemate";
	}
	@GetMapping("/mate_makegroup")
	public String makegroup() {
		return "mate_makegroup";
	}
}