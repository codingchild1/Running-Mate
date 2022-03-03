package com.mulcam.run.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value="/login", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(@RequestParam Map<String,String> info) {
		ModelAndView modelAndView=new ModelAndView("login");
		try {
			String id=info.get("id");
			String password=info.get("password");
			if(memberService.accessMember(id, password)) {
				session.setAttribute("id", id);
				modelAndView.addObject("cpage", "join");
			} else throw new Exception();
		} catch(EmptyResultDataAccessException e) {
			modelAndView.addObject("err", "아이디가 존재하지 않습니다");
			modelAndView.addObject("cpage", "err");
		} catch(Exception e){
			modelAndView.addObject("err", e.getMessage());
			modelAndView.addObject("cpage", "err");
		}
		return modelAndView;
	}
	
	//logout
	@GetMapping(value="/logout")
	public String logout(HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		session.removeAttribute("id");
		model.addAttribute("cpage", "login");
		return "member_list";
	}
	
	//mypage
	@RequestMapping(value="mypage", method=RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
//		
//		Member mem = (Member)session.getAttribute("member");
//		String memberId = mem.getId();
//		
//		Member memberInfo = memberService.getInfo(memberId);
//		model.addAttribute("memberInfo", memberInfo);
		
		return "mypage";
	}
	
	@RequestMapping(value="passwordChange", method=RequestMethod.GET)
	public String passwordChange() {
		return "passwordChange";
	}
	
	@RequestMapping(value="todaylist", method=RequestMethod.GET)
	public String todaylist() {
		return "todaylist";
	}
		
	@RequestMapping(value="fblist", method=RequestMethod.GET)
	public String fblist() {
		return "fblist";
	}
}