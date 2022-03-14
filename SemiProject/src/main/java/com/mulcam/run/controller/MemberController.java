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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mulcam.run.dto.Board;
import com.mulcam.run.dto.Member;
import com.mulcam.run.service.BoardService;
import com.mulcam.run.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	BoardService boardService;
	
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

			} 
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
		String path = servletContext.getRealPath("/profile/");
		File destFile = new File(path+file.getOriginalFilename());
		try {
			file.transferTo(destFile);
		} catch(IOException e) {
			e.printStackTrace();
		}

		
		Member mem = new Member(id, name, password, email, phone, file.getOriginalFilename());
		Member member = new Member();

		try {
			memberService.makeMember(mem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/login";
	}
		
	
	@GetMapping(value="/mypage")
	public String mypage() {
		return "/mypage";
	}
	//마이페이지 post도 있어야 될 듯 요청 페이지 프로필도 추가하고...
	
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
	
	@GetMapping(value="/memberlist")
	public String memberList(Model model) {
		List<Member> list = memberService.memberList();
		model.addAttribute("list", list);
		return "memberlist";
	}
	@RequestMapping(value="/memberdelete", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteMember(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size;i++) {
			memberService.delete(ajaxMsg[i]);
		}
		return "redirect:memberlist";
	}
	
	@GetMapping(value="/fblist")
	public String fbList(Model model) {
		String id = (String) session.getAttribute("id");
		List<Board> fblist = boardService.fbList(id);
		model.addAttribute("fblist", fblist);
		for(Board br : fblist) {
			System.out.println(br.fb_articleNo);
		}
		return "fblist";
		}
	
	@GetMapping(value="/profileview/{filename}")
	public void fileview(@PathVariable String filename,
			HttpServletRequest request, HttpServletResponse response) {
	/*현재 /fileview/board/${file.originalFilename } 경로로 요청이 들어왔는데,
	${file.originalFilename }은 URL에 변수를 담은 템플릿변수에 해당한다. 이를 filename이라는 변수로 받은 것이고
	요청을 처리하는 메서드에서 이를 파라미터로 받아서 처리해야하기 때문에 PathVaribale이라는 어노테이션을 사용한다. */
		String path=servletContext.getRealPath("/profile/");
		File file=new File(path+filename); 
		String sfilename=null;
		FileInputStream fis=null;
		try {
			if(request.getHeader("User-Agent").indexOf("MSIE")>-1) {
				sfilename=URLEncoder.encode(file.getName(), "UTF-8");
			} else {
				sfilename=new String(file.getName().getBytes("UTF-8"), "ISO-8859-1");
			}
			response.setCharacterEncoding("UTF-8");
			response.setContentType("application/octet-stream; charest=UTF-8");
//			response.setHeader("Content-Disposition", "attachment; filename="+sfilename);
			OutputStream out=response.getOutputStream();
			fis=new FileInputStream(file);
			FileCopyUtils.copy(fis, out); 
			out.flush(); 
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(fis!=null) {
				try{
					fis.close(); 
				} catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	@RequestMapping(value="update", method= {RequestMethod.POST})
	public String memberUpdate(@RequestParam(value="profile") MultipartFile profile, @RequestParam(value="email") String email, @RequestParam(value="phone")
	String phone, @RequestParam(value="id") String id) {
		String path = servletContext.getRealPath("/profile/");
		File destFile = new File(path+profile.getOriginalFilename());
		try {
			profile.transferTo(destFile);
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		Member mem = new Member(profile.getOriginalFilename(), email, phone, id);

		try {
			memberService.updateMember(mem);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/mypage";
		

	}
	
	
	@GetMapping(value="/delete")
	public String deleteForm() {
		return "delete";
	}
	
	@PostMapping(value="/delete")
	public String deleteMem(@RequestParam("password") String password) {
		String id = (String) session.getAttribute("id");
		String pw = memberService.checkPw(id);
		if(!password.equals(pw)) {
			return "delete";
		}
		memberService.delete(id);
		session.invalidate();
		return "login";
	}
	
	@PostMapping(value="/changepw")
	public String pwChange(@RequestParam("password") String password, @RequestParam("newPw") String newPw) {
		String id = (String) session.getAttribute("id");
		String pw = memberService.checkPw(id);
		Member mem = new Member(id, newPw);
		if(password.equals(pw)) {
			memberService.modifyPw(mem);
			session.invalidate();
			return "login";
		}
		
		return "redirect:/changepw";
		
	}
	
	@GetMapping(value="/changepw")
	public String changePw() {
		return "changepw";
	}
	
	
}

