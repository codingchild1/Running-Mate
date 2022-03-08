package com.mulcam.run.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mulcam.run.dto.Group;
import com.mulcam.run.dto.GroupAndMate;
import com.mulcam.run.dto.Mate;
import com.mulcam.run.dto.Ptp;
import com.mulcam.run.service.MateService;
import com.mysql.cj.Session;

@Controller
public class MateController {

	@Autowired
	MateService mateService;
	
	@Autowired
	HttpSession session;

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
//		ModelAndView mv = new ModelAndView();
		try {
//			List<Ptp> ptps = mateService.ptpInfo(mate_articleNO);
//			mv.addObject("ptps",ptps);
//			System.out.println(ptps);
			Mate mate = mateService.mateInfo(mate_articleNO);
			result = new ResponseEntity<Mate>(mate, HttpStatus.OK);
		}catch(Exception e) {
			result = new ResponseEntity<Mate>(HttpStatus.BAD_REQUEST);
		}
		return result;
	}
	
	@ResponseBody
	@PostMapping("/ptplist")
	public ResponseEntity<List<Ptp>> ptplist(@RequestParam(value="no",required = false) int mate_articleNO) {
		ResponseEntity<List<Ptp>> result = null; 
		try {
			 List<Ptp> ptp = mateService.ptpInfo(mate_articleNO);
//			Ptp ptp = mateService.ptpInfo(mate_articleNO);
			result = new ResponseEntity<List<Ptp>>(ptp, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
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
	
	
	@GetMapping("/mate_updategroup")
	public String mate_updategroup(@RequestParam("ptp")int group_articleNO, Model model) {
		try {
		 Group group = mateService.groupInfo(group_articleNO);
			model.addAttribute(group);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "mate_updategroup";
	}
	
	@PostMapping("/mate_updategroup")
	public ModelAndView mate_updategroup2(Group group) {
		ModelAndView mv = new ModelAndView("redirect:/mate_main");
		try{
			mateService.updateGroup(group);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	@ResponseBody
	@PostMapping("/deletemate")
	public void deletemate(@RequestParam(value="no")int mate_articleNO) {
		try {
			System.out.println(mate_articleNO);
			mateService.removeMate(mate_articleNO);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@PostMapping("/deletegroup")
	public void deletegroup(@RequestParam(value="no")int group_articleNO) {
		try {
			System.out.println(group_articleNO);
			mateService.removeGroup(group_articleNO);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}