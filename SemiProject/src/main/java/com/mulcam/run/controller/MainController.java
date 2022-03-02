package com.mulcam.run.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mulcam.run.service.BoardService;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	BoardService boardService;
	
	@GetMapping(value="/main")
	public String Main() {
		return "main";
	}
}
