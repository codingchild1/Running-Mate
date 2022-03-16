package com.mulcam.run.controller;



import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.run.dto.Board;
import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.dto.Reply;
import com.mulcam.run.dto.ReplyInfo;
import com.mulcam.run.service.AlertService;
import com.mulcam.run.service.BoardService;
import com.mulcam.run.service.LikesService;
import com.mulcam.run.service.MemberService;
import com.mulcam.run.service.ReplyService;

@Controller
@RequestMapping("/")
public class FBController {

	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	HttpSession session;
	
	@Autowired 
	private HttpServletRequest request;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	AlertService alertService;

	@Autowired
	LikesService likesService;
	
	@Autowired
	ReplyService replyService;
	
	@GetMapping("/fb_result")
	public ModelAndView SearchList(@RequestParam String column, @RequestParam String keyword, @RequestParam(value="page",required=false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();
		System.out.println("column:" + column);
		PageInfo pageInfo = new PageInfo();
		try {
			List<Board> articleList = boardService.getBoardSearchResultList(column, keyword, page, pageInfo);
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("articleList", articleList);
			mv.addObject("keyword", keyword);
			mv.addObject("column", column);
			mv.setViewName("/fb_result");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
			mv.setViewName("/err");
		}
		
		return mv;
	}
	
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
			mv.setViewName("/err");
		}
		
		return mv;
	}
	
	/* 게시글 상세 보기 */
	@RequestMapping(value="/fb_detail", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView boardDetail(@RequestParam(value="fb_articleNo") int fb_articleNo,
			@RequestParam(value="page") int page) {
		ModelAndView mv = new ModelAndView();
		try {
			Board board = boardService.getBoard(fb_articleNo);
			String writer = (String) session.getAttribute("id");
			
			int admin = memberService.queryById(writer).getAdminCk();
			session.setAttribute("adminCheck", admin);
			boolean likes = likesService.getLikesTF(writer, "article", fb_articleNo);
			boolean alert = alertService.getAlertTF(writer, "article", fb_articleNo);
			if(likes==false) {
				mv.addObject("likes", "false");
			} else {
				mv.addObject("likes", "true");
			}
			if(alert==false) {
				mv.addObject("alert", "false");
			} else {
				mv.addObject("alert", "true");
			}
			mv.addObject("user_id", writer);
			mv.addObject("article", board);
			mv.addObject("page", page);
			
			ReplyInfo relyinfo = new ReplyInfo("freeboard", fb_articleNo);
			List<Reply> replylist = replyService.replyList(relyinfo);
			mv.addObject("replylist", replylist);	
			mv.addObject("user_profile", writer);	
			
			mv.setViewName("/fb_detail");
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
			mv.setViewName("/err");
		}
		return mv;
	}
	

	
	
	//삭제폼
	@GetMapping(value="/fb_delete")
	public ModelAndView deleteform(@RequestParam(value="fb_articleNo", required=false, defaultValue = "1") int fb_articleNo,
			@RequestParam(value="page", required=false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();
		try {
		boardService.removeBoard(fb_articleNo);
		mv.addObject("fb_articleNo", fb_articleNo);
		mv.addObject("page", page);
		mv.setViewName("fb_delete");
		mv.setViewName("redirect:/fb_main");
	} catch(Exception e) {
		e.printStackTrace();
		mv.addObject("err", e.getMessage());
		mv.setViewName("/err");	
	}
	return mv;
}
	
/*
 * //삭제하기
 * 
 * @PostMapping(value="/fb_delete") public ModelAndView
 * boarddelete(@RequestParam(value="fb_articleNo") int fb_articleNo,
 * 
 * @RequestParam(value="page", required=false, defaultValue = "1") int page) {
 * ModelAndView mv = new ModelAndView(); try {
 * boardService.removeBoard(fb_articleNo); mv.addObject("page", page);
 * mv.setViewName("redirect:/fb_main"); } catch(Exception e) {
 * e.printStackTrace(); mv.addObject("err", e.getMessage());
 * mv.setViewName("/err"); } return mv; }
 */
	
	@GetMapping(value="/fb_modify")
	public ModelAndView modifyform(@RequestParam(value="fb_articleNo") int fb_articleNo
			) {
		ModelAndView mv = new ModelAndView();
		try {
			Board board = boardService.getBoard(fb_articleNo);
			mv.addObject("article", board);
			mv.setViewName("/fb_modify");
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
		}
		
		return mv;
	}
	
	@PostMapping(value="/boardmodify")
	public ModelAndView boardmodify(@ModelAttribute Board board, @RequestParam(value="page", required=false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();
		try {
			boardService.modifyBoard(board);
			mv.addObject("fb_articleNo", board.getFb_articleNo());
			mv.addObject("page", page);
			mv.setViewName("redirect:/fb_detail");
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
			mv.setViewName("/err");	
		}
		
		return mv;
	}
	
	
	
//	@GetMapping(value = "search")
//	@ResponseBody
//	private List<Board> getSearchList(@RequestParam(value="keyword") String keyword, Model model)throws Exception{
//		Board board = new Board();
//		return boardService.getSearchList(board);
//		}
	
	/* 게시글 등록 하기 */
	@GetMapping("fb_writing")
	public ModelAndView write() {
		ModelAndView mv = new ModelAndView("fb_writing");
		String writer = (String)session.getAttribute("id"); // 세션의 id = writer
		try {
			String user_img2 = memberService.profileImg(writer);
			mv.addObject("user_img2",user_img2);
		}catch(Exception e) {
			e.printStackTrace();

		}
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/fb_upload")
	public Map<String, Object> fileupload(@RequestParam(value="upload") MultipartFile file) {
		String path = servletContext.getRealPath("/upload/");
		String filename = file.getOriginalFilename();
		File destFile = new File(path+filename);
		Map<String, Object> json = new HashMap<>();
		try {
			file.transferTo(destFile);
			json.put("uploaded", 1);
			json.put("fileName", filename);
			json.put("url", "/fileview/"+filename);
		} catch(IOException e) {
			e.printStackTrace();
		} 
		return json;
	}	
	
	@GetMapping(value="/file/{filename}")
	public void fileview(@PathVariable String filename, 
			HttpServletRequest request, HttpServletResponse response)
	{
		String path = servletContext.getRealPath("/upload/");
		File file = new File(path+filename);
		String sfilename = null;
		FileInputStream fis = null;
		
		try {
			if(request.getHeader("User-Agent").indexOf("MSIE")>-1) {
				sfilename = URLEncoder.encode(file.getName(), "utf-8");
			} else {
				sfilename = new String(file.getName().getBytes("utf-8"), "ISO-8859-1");
			}
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/octet-stream;charset=utf-8");
			//response.setHeader("Content-Disposition", "attachment; filename=\""+sfilename+"\";");
			response.setHeader("Content-Disposition", "attachment; filename="+sfilename);
			OutputStream out = response.getOutputStream();
			fis= new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			out.flush();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(fis!=null) {
				try {
					fis.close();
				} catch(Exception e) {}
			}
		}		
	}	
	
	@PostMapping("fb_write")
	public ModelAndView write(@ModelAttribute Board board, @RequestParam("fb_title") String title,
			@RequestParam("fb_content") String content) {
		/*
		 * HttpSession session = request.getSession(); //세션 요청
		 */		
		ModelAndView mv = new ModelAndView("redirect:/fb_main");
		String writer = (String)session.getAttribute("id"); // 세션의 id = writer
		System.out.println(title);  // DB저장
		System.out.println(content.trim());  // DB저장, 반드시 trim()
		System.out.println(writer);  // DB저장
		board.setFb_title(title);
		board.setFb_content(content);
		board.setWriter(writer);	// dto에 writer 입력?
		try {
			String user_img2 = memberService.profileImg(writer);
			mv.addObject("user_img2",user_img2);
			boardService.insertContent(board);
			System.out.println(user_img2);
			System.out.println(writer);
			
			/* String writer = (String) session.getAttribute("id"); */
		} catch(Exception e) {
			mv.setViewName("fb_writing");
			e.printStackTrace();
		}
		return mv;
	}
	

}
