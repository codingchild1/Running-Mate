package com.mulcam.run.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.run.dto.Group;
import com.mulcam.run.dto.GroupAndMate;
import com.mulcam.run.dto.Mate;
import com.mulcam.run.dto.Ptp;
import com.mulcam.run.service.MateService;

@Controller
public class MateController {

	@Autowired
	MateService mateService;

//	@GetMapping(value="/")
//	public String bankmain(Model model) {
//		model.addAttribute("cpage", "main");
//		return "main2";
//	}

	@GetMapping("/mate_main")
	public ModelAndView mate_main() {
		ModelAndView mv = new ModelAndView();
		try {
			List<GroupAndMate> mates = mateService.allpostInfo();
			mv.addObject("mates",mates);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mv;
	}
	
	@ResponseBody
	@PostMapping("/Mmodal")
	public ResponseEntity<Mate> Mmodal(@RequestParam(value="no",required = false) int mate_articleNO) {
		ResponseEntity<Mate> result = null; 
		try {
			Mate mate = mateService.mateInfo(mate_articleNO);
			result = new ResponseEntity<Mate>(mate, HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<Mate>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
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
//	@ResponseBody
//	@PostMapping("/Like")
//	public ResponseEntity<String> Like(@RequestParam(value="no")int mate_articleNO,Ptp ptp){
//		ResponseEntity<String> result =null;
//		try {
//			System.out.println("controller");
//			mateService.like(mate_articleNO);
//			mateService.makePtp(ptp);
//			System.out.println(ptp.getUser_id());
//			System.out.println(ptp.getMate_articleNO());
//			result = new ResponseEntity<String>("참여완료",HttpStatus.OK);
//		}catch(Exception e) {
//			
//		}
//		return result;
//	}	
	
	@ResponseBody
	@PostMapping("/Like")
	public void Like(@RequestParam(value="no")int mate_articleNO,Ptp ptp){
		try {
			mateService.like(mate_articleNO);
			mateService.makePtp(ptp);
			System.out.println(ptp.getUser_id());
			System.out.println(ptp.getMate_articleNO());
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	

	
	
	
	@ResponseBody
	@PostMapping("/LikeCancel")
	public void LikeCancel(@RequestParam(value="no")int mate_articleNO){
		try {
			mateService.likeCancel(mate_articleNO);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@GetMapping("/mate_search")
	public String mate_search() {
		return "mate_search";
	}

	@GetMapping("/mate_map")
	public String mate_map() {
		return "mate_map";
	}

	@GetMapping("/mate_makemate")
	public String mate_makemate() {
		return "mate_makemate";
	}


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
	@GetMapping("/mate_makegroup")
	public String mate_makegroup() {
		return "mate_makegroup";
	}
	 
	@PostMapping("/mate_makegroup")
	public ModelAndView mate_makegroup2(Group group) {
		ModelAndView mv = new ModelAndView("redirect:/mate_main");
		try {
			mateService.makeGroup(group);
			System.out.println(group.getUser_id());
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
}