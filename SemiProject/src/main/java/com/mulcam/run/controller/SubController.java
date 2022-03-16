package com.mulcam.run.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mulcam.run.dto.Reply;
import com.mulcam.run.dto.ReplyInfo;
import com.mulcam.run.service.AlertService;
import com.mulcam.run.service.BoardService;
import com.mulcam.run.service.LikesService;
import com.mulcam.run.service.MateService;
import com.mulcam.run.service.ReplyService;
import com.mulcam.run.service.RouteService;
import com.mulcam.run.service.TodayService;
import com.mulcam.run.service.WarningService;

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
	
	@Autowired
	TodayService todayService;

	@Autowired
	WarningService warningService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	BoardService boardService;
	@Autowired
	ReplyService replyService;
	
	@ResponseBody
	@PostMapping(value="/likes")
	public boolean likes(@RequestParam("user_id") String user_id ,@RequestParam("board_type") String board_type, @RequestParam("board_no") int board_no) {
		boolean likes = false;
		String my_id = (String) session.getAttribute("id");
		// 현재 게시물에 like에 대한 정보 확인
		try {
			
			likes = likesService.getLikesTF(my_id, board_type, board_no);
			if(likes == false) {
				likesService.insertLikes(my_id, board_type, board_no);
				switch(board_type) {
				case "mate":
					break;
				case "today": 
					todayService.LikesPlus(board_no);
					break;
				case "route":
					routeService.LikesPlus(board_no);
					break;
				case "article":
					boardService.LikesPlus5(board_no);
					break;
				default:
					break;
				}
				
				likes = true;
			} else {
				likesService.deleteLikes(my_id, board_type, board_no);
				switch(board_type) {
				case "mate":
					break;
				case "today":
					todayService.LikesMinus(board_no);
					break;
				case "route":
					routeService.LikesMinus(board_no);
					break;
				case "article":
					boardService.LikesMinus5(board_no);
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
		String my_id = (String) session.getAttribute("id");
		try {
			alert = alertService.getAlertTF(my_id, board_type, board_no);	// 현재 게시물에 alert에 대한 정보 확인
			if(alert == false) {
				alertService.insertAlert(my_id, board_type, board_no);
				warningService.insert(board_type, board_no, user_id);
				alert = true;
			} else {
				alertService.deleteAlert(my_id, board_type, board_no);
				warningService.cancel(board_type, board_no, user_id);
				alert = false;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return alert;
	}
	
	@ResponseBody
	@PostMapping(value="/reply")
	public void reply(@ModelAttribute Reply reply, Model model) {
		try {
			replyService.insertReply(reply);
			//ReplyInfo replyinfo = new ReplyInfo(reply.getBoard_type(), reply.getBoard_no());
			//List<Reply> replylist = replyService.replyList(replyinfo);
			//model.addAttribute("replylist", replylist);	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@PostMapping(value="/replydelete")
	public void replydelete(@RequestParam("reply_no") int reply_no) {
		try {
			System.out.println(reply_no);
			replyService.deleteReply(reply_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
