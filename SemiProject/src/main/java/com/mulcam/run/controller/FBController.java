package com.mulcam.run.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.run.dto.Board;
import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.service.BoardService;

@Controller
@RequestMapping("/")
public class FBController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ServletContext servletContext;
	
	/* 게시글 불러오기 */
	@RequestMapping(value="/fb_main", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardList(@RequestParam(value="page",required=false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();
		PageInfo pageInfo = new PageInfo();
		try {
			List<Board> articleList = boardService.getBoardList(page, pageInfo);
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("articleList", articleList);
			mv.setViewName("/fb_main");
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
			mv.setViewName("/board/err");
		}
		
		return mv;
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
