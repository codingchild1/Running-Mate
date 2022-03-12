package com.mulcam.run.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.run.dto.Group;
import com.mulcam.run.dto.GroupAndMate;
import com.mulcam.run.dto.Mate;
import com.mulcam.run.dto.Ptp;
import com.mulcam.run.service.AlertService;
import com.mulcam.run.service.MateService;
import com.mulcam.run.service.MemberService;
import com.mysql.cj.Session;

@Controller
public class MateController {

	@Autowired
	MateService mateService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	AlertService alertService;
	
	@Autowired
	HttpSession session;
	
	//메인페이지 이동
	@GetMapping("/mate_main")
	public ModelAndView mate_main() {
		ModelAndView mv = new ModelAndView();
		try {
			List<GroupAndMate> mates = mateService.allpostInfo();
			mv.addObject("mates",mates);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	//번개 모달창 띄우는기능
	@ResponseBody
	@PostMapping("/Mmodal")
	public ResponseEntity<Mate> Mmodal(@RequestParam(value="no",required = false) int mate_articleNO,
			Model model) {
		ResponseEntity<Mate> result = null;
		try {
			Mate mate = mateService.mateInfo(mate_articleNO);
			result = new ResponseEntity<Mate>(mate, HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<Mate>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	//번개 참여자리스트 기능
	@ResponseBody
	@PostMapping("/ptplist")
	public ResponseEntity<List<Ptp>> ptplist(@RequestParam(value="no",required = false) int mate_articleNO) {
		ResponseEntity<List<Ptp>> result = null; 
		try {
			 List<Ptp> ptp = mateService.ptpInfo(mate_articleNO);
			result = new ResponseEntity<List<Ptp>>(ptp, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//소모임 모달창 띄우는기능
	@ResponseBody
	@PostMapping("/Gmodal")
	public ResponseEntity<Group> Gmodal(@RequestParam(value="no",required = false) int group_articleNO) {
		ResponseEntity<Group> result = null; 
		try {
			Group group = mateService.groupInfo(group_articleNO);
			result = new ResponseEntity<Group>(group, HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<Group>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	//좋아요 기능
	@ResponseBody
	@PostMapping("/Like")
	public boolean Like(@RequestParam(value="no")int mate_articleNO,HttpServletRequest request){
		boolean islike = false;
		try {
			HttpSession session = request.getSession();
			String user_id = (String) session.getAttribute("id");
			islike= mateService.likequery(mate_articleNO, user_id);
			if (islike == true) {
				mateService.likeCancel(mate_articleNO);
				mateService.deletePtp(mate_articleNO, user_id);
			} else {
				mateService.like(mate_articleNO);
				mateService.makePtp(mate_articleNO,user_id);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return islike;
	}
	
	//검색창 이동
	@GetMapping("/mate_search")
	public ModelAndView mate_search() {
		ModelAndView mv = new ModelAndView();
		try {
			List<GroupAndMate> mates = mateService.allpostInfo();
			mv.addObject("mates",mates);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	//검색기능
	@GetMapping("/mate_searchinfo")
	public String searchinfo(@RequestParam(value="type") String type,
							@RequestParam(value="option") String option,
							@RequestParam(value="input") String input,Model model) {
		try {
			System.out.println(type);
			if(type.equals("all")) {
				List<GroupAndMate> mates = mateService.searchInfoAll(option, input);
				model.addAttribute("mates",mates);
				model.addAttribute("input",input);
			}else {
				List<GroupAndMate> mates = mateService.searchInfo(type, option, input);
				model.addAttribute("mates",mates);
				model.addAttribute("input",input);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "mate_search";
	}

	
	@GetMapping("/mate_map")
	public ModelAndView mate_map() {
		ModelAndView mv = new ModelAndView();
		try {
			List<GroupAndMate> mates = mateService.allpostInfo();
			List<String> mapinfo = mateService.allMapInfo();
			List<String> titleinfo = mateService.allTitleInfo();
//			Map<String,Object> map = new HashMap<>();
			mv.addObject("mates",mates);
			mv.addObject("mapinfo",mapinfo);
			mv.addObject("titleinfo",titleinfo);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@GetMapping("/mate_mapsearch")
	public ResponseEntity<List<GroupAndMate>> mate_mapSearch(@RequestParam(value="input")String input,
			@RequestParam(value="type")String type) {
		ResponseEntity<List<GroupAndMate>> result = null;
		System.out.println(input+" "+type);
		try {
			if(type.equals("all")) {
				if(input.equals("")) {
					List<GroupAndMate> mates = mateService.allpostInfo();
					result = new ResponseEntity<List<GroupAndMate>>(mates, HttpStatus.OK);
					System.out.println("검색값 안넣고 all조회");
				}else {
					List<GroupAndMate> mates = mateService.addressinfo(input);
					result = new ResponseEntity<List<GroupAndMate>>(mates, HttpStatus.OK);
					System.out.println("검색값 넣고 all조회");
				}
			}else {
				if(input.equals("")) {
					List<GroupAndMate> mates = mateService.addressinfo3(type);
					result = new ResponseEntity<List<GroupAndMate>>(mates, HttpStatus.OK);
					System.out.println("검색값 안넣고 부분조회");
				}else {
					List<GroupAndMate> mates = mateService.addressinfo2(type, input);
					result = new ResponseEntity<List<GroupAndMate>>(mates, HttpStatus.OK);
					System.out.println("검색값 넣고 부분조회");
				}
			}
			System.out.println(input);
			System.out.println(result);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	//번개 게시물 작성페이지로 이동
	/*
	 * @GetMapping("/mate_makemate") public String mate_makemate() { return
	 * "mate_makemate"; }
	 */
	//번개 게시물 작성페이지로 이동
	@GetMapping("/mate_makemate")
	public ModelAndView mate_makemate() {
		ModelAndView mv = new ModelAndView("mate_makemate");
		try {
			String id = (String) session.getAttribute("id");
			String user_img2 = memberService.profileImg(id);
			mv.addObject("id",id);
			mv.addObject("user_img2",user_img2);
			System.out.println(id);
			System.out.println(user_img2);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	//번개 게시물 작성기능
	@PostMapping("/mate_makemate")
	public ModelAndView mate_makemate2(Mate mate) {
		ModelAndView mv = new ModelAndView("redirect:/mate_main");
		try {
			mateService.makeMate(mate);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	//소모임 게시물 작성페이지로 이동
	
	  @GetMapping("/mate_makegroup") 
	  public ModelAndView mate_makegroup() {
		  ModelAndView mv = new ModelAndView("mate_makegroup");
		  try {
			  String id = (String) session.getAttribute("id");
			  String user_img2 = memberService.profileImg(id);
			  mv.addObject("id",id);
			  mv.addObject("user_img2",user_img2);
		  }catch (Exception e) {
			e.printStackTrace();
		  }
		  return mv; 
	  }
	 
	
	 
	//소모임 게시물 작성기능
	@PostMapping("/mate_makegroup")
	public ModelAndView mate_makegroup2(Group group) {
		ModelAndView mv = new ModelAndView("redirect:/mate_main");
		try {
			mateService.makeGroup(group);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	//번개 게시물 수정페이지로 이동
	@GetMapping("/mate_updatemate")
	public String mate_updatemate(@RequestParam("ptp")int mate_articleNO, Model model) {
		try {
			Mate mate = mateService.mateInfo(mate_articleNO);
			model.addAttribute("mate",mate);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "mate_updatemate";
	}
	
	//번개 게시물 수정기능
	@PostMapping("/mate_updatemate")
	public ModelAndView mate_updatemate2(Mate mate) {
		ModelAndView mv = new ModelAndView("redirect:/mate_main");
		try{
			mateService.updateMate(mate);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	//소모임 게시물 수정페이지로 이동
	@GetMapping("/mate_updategroup")
	public String mate_updategroup(@RequestParam("ptp")int group_articleNO, Model model) {
		try {
		 Group group = mateService.groupInfo(group_articleNO);
		 model.addAttribute("group",group);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "mate_updategroup";
	}
	
	//소모임 게시물 수정기능
	@PostMapping("/mate_updategroup")
	public ModelAndView mate_updategroup2(Group group) {
		ModelAndView mv = new ModelAndView("redirect:/mate_main");
		try{
			mateService.updateGroup(group);
			System.out.println("controller");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	//번개 게시물 삭제기능
	@ResponseBody
	@PostMapping("/deletemate")
	public void deletemate(@RequestParam(value="no")int mate_articleNO) {
		try {
			mateService.removeMate(mate_articleNO);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//소모임 게시물 삭제기능
	@ResponseBody
	@PostMapping("/deletegroup")
	public void deletegroup(@RequestParam(value="no")int group_articleNO) {
		try {
			mateService.removeGroup(group_articleNO);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}