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
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.dto.Reply;
import com.mulcam.run.dto.ReplyInfo;
import com.mulcam.run.dto.Today;
import com.mulcam.run.service.AlertService;
import com.mulcam.run.service.LikesService;
import com.mulcam.run.service.MemberService;
import com.mulcam.run.service.ReplyService;
import com.mulcam.run.service.TodayService;


@Controller
public class TodayController {

	@Autowired
	TodayService todayService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	LikesService likesService;
	
	@Autowired
	AlertService alertService;

	@Autowired
	ReplyService replyService;

	
	@Autowired
	private ServletContext servletContext;

	// 1. 오늘의 러닝 메인페이지, today_list
	//@GetMapping("/today")
	@RequestMapping(value="/today", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView today_list(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		ModelAndView mav=new ModelAndView();
		PageInfo pageInfo=new PageInfo();
		try {
			List<Today> todayList=todayService.getTBoardList(page, pageInfo);
			System.out.println(todayList.size());
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("todayList", todayList);
			Map<String, String> profileImgMap= new HashMap<String, String>();
			for(int i=0;i<todayList.size();i++) {
				String writerId = todayList.get(i).getUser_id();
				String profileImg = memberService.profileImg(writerId);
				profileImgMap.put(writerId, profileImg);
			}
			mav.addObject("profileImgMap", profileImgMap);
			mav.setViewName("today");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject("todayList", "오늘의 러닝 메인페이지 에러");
			mav.setViewName("err");
		}
		return mav;
	}

	// 2.전체페이지 검색정보(search)

	@RequestMapping(value="/today_search", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView searchInfo(@RequestParam(value="page", required=false, defaultValue="1") int page, @RequestParam(value="todaySearchText") String search) {
		ModelAndView mav=new ModelAndView();
		PageInfo pageInfo=new PageInfo();
		try {
			List<Today> todayList=todayService.getSearchBoardList(search, page, pageInfo);
			System.out.println(todayList.size());
			for(Today t : todayList ) {
				System.out.println("제목:"+t.getToday_title()+"// 내용:"+t.getToday_contents());
			}
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("todayList", todayList);
			mav.addObject("todaySearchText", search);
			Map<String, String> profileImgMap= new HashMap<String, String>();
			for(int i=0;i<todayList.size();i++) {
				String writerId = todayList.get(i).getUser_id();
				String profileImg = memberService.profileImg(writerId);
				profileImgMap.put(writerId, profileImg);
			}
			mav.addObject("profileImgMap", profileImgMap);
			mav.setViewName("todayResult");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("err");
		}
		return mav;
	}

	
	//@PostMapping("/today_make") 
	@RequestMapping(value="/today_make", method= {RequestMethod.GET, RequestMethod.POST})
	public String todayMake(Model model) {
		String wirte_id = (String) session.getAttribute("id");
		String user_img2;
		try {
			user_img2 = memberService.profileImg(wirte_id);
			model.addAttribute("wirte_id", wirte_id);
			model.addAttribute("user_img2", user_img2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		return "today_make";
	}
	
	//3-1.ckeditor5 업로드
	@ResponseBody
	@PostMapping("/upload")
	public Map<String, Object> fileupload(@RequestParam(value="upload") MultipartFile file) {
		System.out.println(file.getOriginalFilename()+"---------------------");
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
	
	//이미지가 바라보는 url 
	@GetMapping(value="/fileview/{filename}")
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
	
	//이미지가 바라보는 url 
	@GetMapping(value="/thumbfileview/{filename}")
	public void thumbfileview(@PathVariable String filename, 
			HttpServletRequest request, HttpServletResponse response)
	{
		String path = servletContext.getRealPath("/thumb/");
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

	// 4. 글쓰기등록요청
	//에디터내용 쓰고 제목과 content내용 model 에 넣어서 
	@PostMapping("/today_contents")
	public String todayContents(@RequestParam("today_title") String today_title,
			@RequestParam("today_contents")String today_contents,
			@RequestParam(value="today_file") MultipartFile file,
			Model model) throws Exception {
		String path = servletContext.getRealPath("/thumb/");
		File destFile = new File(path+file.getOriginalFilename());
		
		String wirte_id = (String) session.getAttribute("id");
		String user_img2 = memberService.profileImg(wirte_id);  
		model.addAttribute("wirte_id", wirte_id);
		model.addAttribute("user_img2", user_img2);
		System.out.println("유저이미지"+user_img2);
		try {
			file.transferTo(destFile);			
		} catch(IOException e) {
			System.out.println("전달오류");
			e.printStackTrace();
		}
		Today Tboard = new Today(wirte_id, user_img2, today_title,file.getOriginalFilename(),today_contents);
		System.out.println(today_title);  // DB저장
		System.out.println(today_contents.trim());  // DB저장, 반드시 trim()
		try {
			todayService.setInputList(Tboard);
			model.addAttribute("today_thumb", file.getOriginalFilename());
			model.addAttribute("title", today_title);
			model.addAttribute("content", today_contents.trim());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/today";
	}
	
	//게시글보기
	@RequestMapping(value="/today_select/{today_articleNo}", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView today_select(@PathVariable int today_articleNo, @RequestParam(value="page", required=false, defaultValue="1")int page) throws Exception {
		ModelAndView mav =new ModelAndView("today_select");						
		PageInfo pageInfo = new PageInfo();
		String user_id = (String) session.getAttribute("id");
		String user_profile = memberService.profileImg(user_id);
		
		boolean likes = likesService.getLikesTF(user_id, "today", today_articleNo);
		boolean alert = alertService.getAlertTF(user_id, "today", today_articleNo);
		
		if(likes==false) {
			mav.addObject("likes", "false");
		} else {
			mav.addObject("likes", "true");
		}
		if(alert==false) {
			mav.addObject("alert", "false");
		} else {
			mav.addObject("alert", "true");
		}
		
		try {
			Today todayselect = todayService.getTBoard(today_articleNo);
			String writerId = todayselect.getUser_id();

			mav.addObject("pageInfo", pageInfo);
		    mav.addObject("todayselect", todayselect);
		    
		    String writer_profile = memberService.profileImg(writerId);
		    mav.addObject("profileImg", writer_profile);
		    
		    System.out.println(page);
		    
		    todayService.updateTodayView(today_articleNo);
		    Today posted = todayService.getTBoard(today_articleNo);
			mav.addObject("id", user_id);
			mav.addObject("todayInfo", posted);	
			
			ReplyInfo relyinfo = new ReplyInfo("today", today_articleNo);
			List<Reply> replylist = replyService.replyList(relyinfo);
			mav.addObject("replylist", replylist);	
			mav.addObject("user_profile", user_profile);	
		    
			} catch(Exception e) {
				e.printStackTrace();
				mav.addObject("err", e.getMessage());
			}
		return mav;
	}

	// 9.수정요청
	@PostMapping("/today_modify")
	public String todayModify(@RequestParam(value="articleNo",required=true) int articleNo,
			@RequestParam("today_title") String today_title,
			@RequestParam("today_contents")String today_contents,
			@RequestParam(value="today_file") MultipartFile file, 
			Model model) {
		try {
			Today tboard = todayService.getTBoard(articleNo);
			if(!file.isEmpty()) {
				String path = servletContext.getRealPath("/thumb/");
				File destFile = new File(path+file.getOriginalFilename());
				file.transferTo(destFile);
				tboard.setToday_thumb(file.getOriginalFilename());
			}
			tboard.setToday_title(today_title);
			tboard.setToday_contents(today_contents);
			todayService.modifyBoard(tboard);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/today";
	}

	// 10.삭제요청
	@PostMapping("/today_delete")
	public ResponseEntity<String> todayDelete(@RequestParam(value="articleNo",required=true) int articleNo) {
		try {
			todayService.removeTBoard(articleNo);
			return new ResponseEntity<String>("삭제되었습니다.", HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("삭제에 실패했습니다..", HttpStatus.BAD_REQUEST);
		}
	}

	// 6.신고 (insert alert)
//	@PostMapping("/report")
//	public String report() {
//		return "report";
//	}

	// 7. 목록누르면 today로 돌아가기
	@GetMapping("/today_list")
	public String today_list() {
		return "today";
	}
}


	