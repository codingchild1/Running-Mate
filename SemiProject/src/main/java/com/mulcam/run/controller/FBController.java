package com.mulcam.run.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mulcam.run.service.BoardService;

@Controller
@RequestMapping("/")
public class FBController {

	@Autowired
	BoardService boardService;
	
	@GetMapping(value="/fb_main")
	public String Fbmain() {
		return "fb_main";
	}
	
	@GetMapping(value="/fb_detail")
	public String Fb_detail() {
		return "fb_detail";
		
	}
	
	@GetMapping(value="/fb_writing")
	public String Fb_writing() {
		return "fb_writing";
	}
	
	
	@PostMapping(value="fb_delete")
	public String Fb_delete() {
		return "redirect:/fb_main";
	}
	
	@PostMapping(value="fb_modify")
	public String Fb_modify(int fb_no) {
	return "redirect:/detail?fb_no="+Integer.toString(fb_no);
	}
	
//	@GetMapping(value = "search")
//	@ResponseBody
//	private List<Board> getSearchList(@RequestParam(value="keyword") String keyword, Model model)throws Exception{
//		Board board = new Board();
//		return boardService.getSearchList(board);
//		}
}
