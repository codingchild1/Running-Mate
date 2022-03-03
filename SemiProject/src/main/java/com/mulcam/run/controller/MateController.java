package com.mulcam.run.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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


	@PostMapping("/mate_makemate")
	public ModelAndView mate_makemate2(Mate mate) {
		ModelAndView mv = new ModelAndView("redirect:/mate_main");
		try {
			mateService.makeMate(mate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	 
	@GetMapping("/mate_makegroup")
	public String makegroup() {
		return "mate_makegroup";
	}
}