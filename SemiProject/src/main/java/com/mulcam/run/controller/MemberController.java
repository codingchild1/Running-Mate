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
import com.mulcam.run.dto.GroupAndMate;
import com.mulcam.run.dto.Mate;
import com.mulcam.run.dto.Member;
import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.dto.Route;
import com.mulcam.run.dto.Today;
import com.mulcam.run.service.BoardService;
import com.mulcam.run.service.MateService;
import com.mulcam.run.service.MemberService;
import com.mulcam.run.service.RouteService;
import com.mulcam.run.service.TodayService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	RouteService routeService;
	
	@Autowired
	TodayService todayService;
	
	@Autowired
	MateService mateService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	private ServletContext servletContext;
	
	
	//로그인 로그인할 때 물고 가는 것 마이페이지를 눌렀을 때 물고 가야 되는 것
//	@RequestMapping(value="/login", method= {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView login(@RequestParam Map<String,String> info) {
//		ModelAndView modelAndView=new ModelAndView("redirect:/mypage");
//		try {
//			String id=info.get("id");
//			String password=info.get("password");
//			if(memberService.accessMember(id, password)) {
//				session.setAttribute("id", id);
//				modelAndView.addObject("mypage");
//				//
//				Member member = memberService.queryById(id);
//				//
//				modelAndView.addObject("member", member);
//	
//			} 
//			} catch(EmptyResultDataAccessException e) {
//				modelAndView.addObject("err", "아이디가 존재하지 않습니다");
//				modelAndView.setViewName("err");
//			} catch(Exception e){
//				modelAndView.addObject("err", e.getMessage());
//				modelAndView.addObject("err", "err");
//			}
//		return modelAndView;
//	}
	
	//로그인
	@GetMapping(value="login")
	public String login() {
		return "login";
	}
	
	@PostMapping(value="login")
	public String loginForm(@RequestParam Map<String,String> info, Model model, HttpSession session) {
		try {
			String id=info.get("id");
			String password=info.get("password");
			if(id ==null || password==null) {
				model.addAttribute("error", "아이디 또는 비밀번호를 입력해 주세요.");
				return "err";
			}
			if(memberService.accessMember(id, password)) {
				session.setAttribute("id", id);
				int admin = memberService.queryById(id).getAdminCk();
				session.setAttribute("adminCheck", admin);
			} else {
				model.addAttribute("err", "아이디 또는 비밀번호가 올바르지 않습니다.");
				return "err";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("err", "로그인 중 문제가 발생했습니다.");
			return "err";
		}
		return "redirect:/main";
	}
	
	
	
	//로그아웃
	@GetMapping(value="/logout")
	public String logout(HttpServletRequest request, Model model) {
		HttpSession session=request.getSession();
		session.removeAttribute("id");
		return "login";
	}
	
	//회원가입
	@GetMapping(value="/join")
	public String joinForm() {
		return "join";
	}
	
	//회원가입
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
		
	//err창에 띄워주기
	@GetMapping(value="/mypage")
	public String mypage(Model model) throws Exception {
		String id = (String) session.getAttribute("id");
		Member member = memberService.queryById(id);
		model.addAttribute(member);
//		modelAndView.addObject("member", member);
		return "/mypage";
	}

	//아이디 중복 확인
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
	
	//회원 목록
	@GetMapping(value="/memberlist")
	public String memberList(Model model) {
		List<Member> list = memberService.memberList();
		model.addAttribute("list", list);
		return "memberlist";
	}
	
	//회원 목록 삭제
	@RequestMapping(value="/memberdelete", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteMember(HttpServletRequest request) {
		
		String[] ajaxMsg = request.getParameterValues("valueArr");
		int size = ajaxMsg.length;
		for(int i=0; i<size;i++) {
			memberService.delete(ajaxMsg[i]);
		}
		return "redirect:memberlist";
	}
	


	//내가 쓴 글 자유게시판
	@RequestMapping(value="/fblist", method= {RequestMethod.GET, RequestMethod.POST})
	public String fbList(@RequestParam(value="page",required=false, defaultValue = "1") int page, Model model) {
		String id = (String) session.getAttribute("id");
		PageInfo pageInfo = new PageInfo();
			
		try {
			List<Board> fblist = boardService.fbList(id, page, pageInfo);
			model.addAttribute("fblist", fblist);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("count", fblist.size());
			for(Board br : fblist) {
				System.out.println(br.fb_articleNo);
			}
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("fblist", null);
		}		
	
		return "fblist";
	}
	//내가 쓴 글 루트 공유
	@RequestMapping(value="/routelist", method= {RequestMethod.GET, RequestMethod.POST})
	public String routeList(@RequestParam(value="page",required=false, defaultValue = "1") int page, Model model) {
		String id = (String) session.getAttribute("id");
		PageInfo pageInfo = new PageInfo();
	
		try {
			List<Route> routelist = routeService.routeList(id, page, pageInfo);
			model.addAttribute("routelist", routelist);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("count", routelist.size());
			for(Route br : routelist) {
				System.out.println(br.route_articleNo);
			}
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("routelist", null);
		}		
		
		
		return "routelist";
	}
	
	//내가 쓴 글 오늘의 런닝
	@RequestMapping(value="/todaylist", method= {RequestMethod.GET, RequestMethod.POST})
	public String todayList(@RequestParam(value="page",required=false, defaultValue = "1") int page, Model model) {
		String id = (String) session.getAttribute("id");
		PageInfo pageInfo = new PageInfo();
		try {
			List<Today> todaylist = todayService.todayList(id, page, pageInfo);
			model.addAttribute("todaylist", todaylist);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("count", todaylist.size());
			
		} catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("todaylist", null);
		}
		
		return "todaylist";
	}
	
	//내가 쓴 글 메이트
	@RequestMapping(value="/matelist", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView mateList(@RequestParam(value="page",required=false, defaultValue = "1") int page, Model model) {
		ModelAndView mv = new ModelAndView("matelist");
		String id = (String) session.getAttribute("id");
		PageInfo pageInfo = new PageInfo();
		try {
			List<GroupAndMate> matelist = mateService.mateList(id, page, pageInfo);
			mv.addObject("matelist", matelist);
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("count", matelist.size());
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("matelist", null);
		}
		
		return mv;
	}
	
	//프로필 프리뷰
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

	//회원 정보 업데이트
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
	
	//회원 탈퇴
	@GetMapping(value="/delete")
	public String deleteForm() {
		return "delete";
	}
	
	//회원 탈퇴
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
	
	//비밀번호 변경
	@GetMapping(value="/changepw")
	public String changePw() {
		return "changepw";
	}
	
	//비밀번호 변경
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
		
	
}
