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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.dto.Today;
import com.mulcam.run.service.TodayService;


@Controller
public class TodayController {

	@Autowired
	TodayService todayService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	private ServletContext servletContext;

	// 1. 오늘의 러닝 메인페이지, today_list
	@GetMapping("/today")
	public ModelAndView today_list(@RequestParam(value="page", required=false, defaultValue="1") int page) {
		ModelAndView mav=new ModelAndView();
		PageInfo pageInfo=new PageInfo();
		try {
			List<Today> todayList=todayService.getTBoardList(page, pageInfo);
			System.out.println(todayList.size());
			mav.addObject("pageInfo", pageInfo);
			mav.addObject("todayList", todayList);
			mav.setViewName("today");
		} catch(Exception e) {
			e.printStackTrace();
			mav.addObject("err", e.getMessage());
			mav.setViewName("err");
		}
		return mav;
	}

	// 2.전체페이지 검색정보(search) ajax 로 구현
	@ResponseBody
	@PostMapping("/today_serch")
	public ModelAndView searchInfo(@ModelAttribute Today tbaord) {
		ModelAndView mav = new ModelAndView("today");
		// ajax 로 구현
		return mav;
	}

	
	@GetMapping("/today_make")
	public String todayMake() {
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
			@RequestParam("today_contents")String today_contents,@RequestParam(value="today_file") MultipartFile file, Model model) {
		String path = servletContext.getRealPath("/thumb/");
		File destFile = new File(path+file.getOriginalFilename());
		String user_id = (String) session.getAttribute("id");
		System.out.println(user_id);
		try {
			file.transferTo(destFile);
		} catch(IOException e) {
			e.printStackTrace();
		}
		Today Tboard = new Today(user_id, today_title,file.getOriginalFilename(),today_contents);
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
	

	@GetMapping("/today_select/{today_articleNo}")
	public ModelAndView today_select(@PathVariable int today_articleNo, @RequestParam(value="page", required=false, defaultValue="1")int page) {
		ModelAndView mav =new ModelAndView("today_select");						
		PageInfo pageInfo = new PageInfo();
		System.out.println(today_articleNo);
		System.out.println(pageInfo);
		//User userInfo = (User)session.getAttribute("user");
		
		// 로그인한 유저 아이디 가져오기 (세션)
		String user_id = "testUser";
		// 지금 들어온 게시물의 no를 통해 작성자 아이디 가져오기
		String writerid="testUser";
		/*
		 * String user_id = (String)session.getAttribute("id"); String
		 * writerid="user_id";
		 */
		Boolean modiAndDel = false;
		
		if (user_id.equals(writerid)) {
			modiAndDel = true;
		} 
		mav.addObject("modiAndDel", modiAndDel);
		
		try {
			System.out.println("try 들어옴");
			
			Today todayselect = todayService.getTBoard(today_articleNo);
			mav.addObject("pageInfo", pageInfo);
		    mav.addObject("todayselect", todayselect);
			System.out.println(page);
			
			} catch(Exception e) {
				e.printStackTrace();
				mav.addObject("err", e.getMessage());
				mav.setViewName("/err");
			}
		return mav;
	}
	

	// 5.취소요청
	@PostMapping("/today_postcancle")
	public String todayPostcancle() {
		return "today";
	}


	// 7.좋아요요청 ajax
	@PostMapping("/today_likes")
	public boolean todayLikes() {
		return false;
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
	@PostMapping("/report")
	public String report() {
		return "report";
	}

	// 7. 목록누르면 today로 돌아가기
	@GetMapping("/today_list")
	public String today_list() {
		return "today";
	}
}


	