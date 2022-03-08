package com.mulcam.run.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

import com.mulcam.run.dto.Member;
import com.mulcam.run.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(value="/login", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(@RequestParam Map<String,String> info) {
		ModelAndView modelAndView=new ModelAndView("mainpage");
		try {
			String id=info.get("id");
			String password=info.get("password");
			if(memberService.accessMember(id, password)) {
				session.setAttribute("id", id);
				modelAndView.addObject("cpage", "mypage");
				
				//
				Member member = memberService.queryById(id);
				//
				modelAndView.addObject("member", member);

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
	
	@GetMapping(value="/menu")
	public String memMenu(HttpServletRequest request, Model model) {
		String cpage=request.getParameter("cpage");
		model.addAttribute("cpage", cpage);
		return "mainpage";
	}
	
	@GetMapping(value="/logout")
	public String logout(HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		session.removeAttribute("id");
		model.addAttribute("cpage", "login");
		return "mainpage";
	}
	@GetMapping(value="/join")
	public String joinForm() {
		return "join";
	}
	
	@PostMapping(value="/join")
	public String join(@RequestParam(value="profile") MultipartFile file,
			@RequestParam("name") String name, @RequestParam("id") String id, @RequestParam("password") String password, @RequestParam("email") String email, @RequestParam("phone")
		String phone, Model model) {
		String path = servletContext.getRealPath("/upload/");
		File destFile = new File(path+file.getOriginalFilename());
		try {
			file.transferTo(destFile);
		} catch(IOException e) {
			e.printStackTrace();
		}

		
		Member mem = new Member(name, id, password, email, phone, file.getOriginalFilename());
//		System.out.println(id);  // DB저장
//		System.out.println(today_contents.trim());  // DB저장, 반드시 trim()
		try {
			memberService.makeMember(mem);
//			model.addAttribute("memberthumb", file.getOriginalFilename());
//			model.addAttribute("title", today_title);
//			model.addAttribute("content", today_contents.trim());
//			return "/login";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/login";
	}
		
	
	@RequestMapping(value="/mypage", method= {RequestMethod.GET, RequestMethod.POST})
	public String mypage() {
		return "mypage";
	}
	
	@ResponseBody
	@PostMapping(value="/memberoverlap")
	public String memberOverlap(@RequestParam(value="id", required=true)String id) {
		boolean overlap=false;
		try {
			overlap=memberService.memOverlap(id);
		} catch(Exception e) {
		}
		return String.valueOf(overlap);
	}
	
	@GetMapping(value="memberlist")
	public String memberList(Model model) {
		List<Member> list = memberService.memberList();
		model.addAttribute("list", list);
		return "memberlist";
	}

}