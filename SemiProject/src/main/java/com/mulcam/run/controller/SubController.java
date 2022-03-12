package com.mulcam.run.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mulcam.run.service.AlertService;
import com.mulcam.run.service.LikesService;
import com.mulcam.run.service.MateService;
import com.mulcam.run.service.RouteService;

@Controller
public class SubController {
	@Autowired
	LikesService likesService;
	
	@Autowired
	AlertService alertService;
	
	@Autowired
	RouteService routeService;
	
	@Autowired
	MateService mateService;
	
	@ResponseBody
	@PostMapping(value="/likes")
	public boolean likes(@RequestParam("user_id") String user_id, @RequestParam("board_type") String board_type, @RequestParam("board_no") int board_no) {
		boolean likes = false;
		
		// 현재 게시물에 like에 대한 정보 확인
		try {
			likes = likesService.getLikesTF(user_id, board_type, board_no);
			if(likes == false) {
				likesService.insertLikes(user_id, board_type, board_no);
				switch(board_type) {
				case "mate":
					break;
				case "today":
					break;
				case "route":
					routeService.LikesPlus(board_no);
					break;
				default:
					break;
				}
				
				likes = true;
			} else {
				likesService.deleteLikes(user_id, board_type, board_no);
				switch(board_type) {
				case "mate":
					break;
				case "today":
					break;
				case "route":
					routeService.LikesMinus(board_no);
					break;
				default:
					break;
				}
				
				
				
				likes = false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	
		return likes;
	}
	
	@ResponseBody
	@PostMapping(value="/alert")
	public boolean alert(@RequestParam("user_id") String user_id, @RequestParam("board_type") String board_type, @RequestParam("board_no") int board_no) {
		boolean alert = false;
		
		// 현재 게시물에 alert에 대한 정보 확인
		try {
			alert = alertService.getAlertTF(user_id, board_type, board_no);
			if(alert == false) {
				alertService.insertAlert(user_id, board_type, board_no);
				switch(board_type) {
				case "mate":
					mateService.mateWarning(board_no);
					break;
				case "group":
					mateService.groupWarning(board_no);
					break;
				case "today":
					break;
				case "route":
					routeService.LikesPlus(board_no);
					break;
				default:
					break;
				}
				
				alert = true;
			} else {
				alertService.deleteAlert(user_id, board_type, board_no);
				switch(board_type) {
				case "mate":
					mateService.mateWarningCanc(board_no);
					break;
				case "group":
					mateService.groupWarningCanc(board_no);
					break;
				case "today":
					break;
				case "route":
					routeService.LikesMinus(board_no);
					break;
				default:
					break;
				}
				
				
				
				alert = false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	
		return alert;
	}

}
