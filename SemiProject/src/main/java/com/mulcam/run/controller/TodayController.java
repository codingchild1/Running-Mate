package com.mulcam.run.controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.run.dto.Today;
import com.mulcam.run.service.TodayService;



@Controller

public class TodayController {
	@Autowired 
	TodayService todayService;
	
	//1. 오늘의 러닝 메인페이지 
	@GetMapping("/today")
	public String main() {
		return "today";
	}
	
	//2.전체페이지 검색정보(search) ajax 로 구현 
	@ResponseBody
	@PostMapping("/today_serch")
	public ModelAndView searchInfo(@ModelAttribute Today tbaord) {
		ModelAndView mav = new ModelAndView("today");
			//ajax 로 구현
		return mav; 
	}
	
	//CKEditor 이미지 업로드 부분
//	@ResponseBody
//	@PostMapping("/imgUpload")
//	public Map<String, Object> imgUpload(@RequestParam("upload") MultipartFile img){
//		return service.uploadImg(img);
//	}
	
	//3.글쓰기페이지요청
	@PostMapping("/today_make")
	public String today_make(@ModelAttribute Today tbaord) {
		  return "today_make";
		//작성시 삽입 (insert)
		//취소시
		  
		  
	}
	
	//4.글쓰기등록요청
	@PostMapping("/today_post")
	public String todayPost() {
		return "today";
	}
	
	//5.취소요청 
	@PostMapping("/today_postcancle")
	public String today_postCancle() {
		return "today";
	}

	//6.게시글보는페이지 
	@PostMapping("/today_select")
	public String today_select() {
    	return "today_select";
    }
//	public ModelAndView todaySelect(@ModelAttribute Today tbaord) {
//	ModelAndView mav = new ModelAndView();
//	return mav;
//	}
	
	//7.좋아요요청 ajax
		@PostMapping("/today_likes")
		public boolean todayLikes() {
			return false;
		}
		
	//8.조회수요청 ajax
		@PostMapping("/today_views")
		public int todayViews() {
			int viewspoint = 5;
			return viewspoint;
		}
	
	//9.수정요청 
		@PostMapping("/today_modify")
		public ModelAndView todayModify() {
			ModelAndView mav = new ModelAndView();
			return mav;
		}
	//10.삭제요청 
		@PostMapping("/today_delete")
		public ModelAndView todayDelete() {
			ModelAndView mav = new ModelAndView();
			return mav;
		}

	//6.신고 (insert alert) 
		@PostMapping("/report")
		public String report() {
			return "report";
		}
	//7. 목록누르면 today로 돌아가기
		@GetMapping("/today_list")
		public String today_list() {
			return "today";
		}
	}
	

