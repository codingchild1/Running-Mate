package com.mulcam.run.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.run.dto.Member;
import com.mulcam.run.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	HttpSession session;
	
	//회원 리스트
	@GetMapping(value="memberlist")
	public ModelAndView memlist() {
		ModelAndView mav = new ModelAndView("member_list");
		try {
			List<Member> memberlist = memberService.AllMemberList();
			mav.addObject("list", memberlist);
			mav.addObject("cpage", "member_list");
		} catch(Exception e) {
			mav.addObject("err", e.getMessage());
			mav.addObject("cpage", "err");
		}
		return mav;
	}
	
	//join	
	@RequestMapping(value="/join", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView joinful(@ModelAttribute Member mem) {
		ModelAndView modelAndView=new ModelAndView("join");
		try {
			memberService.insertMember(mem);
			modelAndView.addObject("cpage", "login");
		} catch(Exception e) {
			modelAndView.addObject("err", e.getMessage());
			modelAndView.addObject("cpage", "err");
		}
		return modelAndView;
	}
}