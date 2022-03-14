package com.mulcam.run.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
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

import com.mulcam.run.dto.GroupAndMate;
import com.mulcam.run.dto.Member;
import com.mulcam.run.dto.PageInfo;
import com.mulcam.run.dto.Route;
import com.mulcam.run.dto.RouteInfo;
import com.mulcam.run.service.AlertService;
import com.mulcam.run.service.LikesService;
import com.mulcam.run.service.MemberService;
import com.mulcam.run.service.RouteService;


@Controller
public class RouteController {
	
	@Autowired
	RouteService routeService;
	
	@Autowired
	LikesService likesService;
	@Autowired
	AlertService alertService;

	@Autowired
	MemberService memberService;
	@Autowired
	HttpSession session;
	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping(value="/route", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView routeMain(@RequestParam(value="page",required=false, defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView("route_main");
		PageInfo pageInfo = new PageInfo();
		try {
			List<RouteInfo> routeslist = routeService.getRoutesList(page, pageInfo);
			
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("routesinfolist", routeslist);
			mv.addObject("count", routeslist.size());
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("routeslist", null);
		}
		return mv;
	}
	
	@PostMapping("/route_sort")
	public String route_sort() {
		return "route_sort";
	}
	
	@PostMapping("/route_write")
	public ModelAndView  route_write(){
		ModelAndView mv = new ModelAndView("route_write");
		try {
			String user_id = (String) session.getAttribute("id");
			String user_profile = memberService.profileImg(user_id);
			mv.addObject("profileImg", user_profile);
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
		}
		
		return mv;
	}
	
	@RequestMapping(value="/sortRoutes", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView sortRoutes(@RequestParam("area") String area,
				@RequestParam("distance_left") int distance_left, @RequestParam("distance_right") int distance_right, 
				@RequestParam(value="page",required=false, defaultValue = "1") int page, Model model) {
		ModelAndView mv = new ModelAndView("route_sort");
		PageInfo pageInfo = new PageInfo();
		System.out.println(area + ", " + distance_left + ", ");
	
		try {
			List<RouteInfo> routeslist = routeService.getSortedRoutes(area, distance_left, distance_right, page, pageInfo);
			System.out.println(pageInfo.getEndPage());
			mv.addObject("pageInfo", pageInfo);
			mv.addObject("routesinfolist", routeslist);
			mv.addObject("count", routeslist.size());
			mv.addObject("area", area);
			mv.addObject("distance_left", distance_left);
			mv.addObject("distance_right", distance_right);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	//게시물 보기
	@RequestMapping(value="/routepost", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView routePost(@RequestParam(value="articleNo",required=true) int articleNo) {
		ModelAndView mv = new ModelAndView("route_post");
		try {
			String user_id = (String) session.getAttribute("id");
			String user_profile = memberService.profileImg(user_id);
			boolean likes = likesService.getLikesTF(user_id, "route", articleNo);
			boolean alert = alertService.getAlertTF(user_id, "route", articleNo);
			if(likes==false) {
				mv.addObject("likes", "false");
			} else {
				mv.addObject("likes", "true");
			}
			if(alert==false) {
				mv.addObject("alert", "false");
			} else {
				mv.addObject("alert", "true");
			}
			
			routeService.updateRoutePostView(articleNo);
			RouteInfo posted = routeService.getRouteInfo(articleNo);
			mv.addObject("route", posted);	
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
		}
		return mv;
	}
	
	//게시물 수정
	@RequestMapping(value="/routeModify", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView routeModify(@RequestParam(value="articleNo",required=true) int articleNo) {
		ModelAndView mv = new ModelAndView("route_modify");
		try {
			RouteInfo posted = routeService.getRouteInfo(articleNo);
			mv.addObject("route", posted);
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
		}
		return mv;
	}
	
	//게시물 삭제
	@RequestMapping(value="/routeDelete", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView routeDelete(@RequestParam(value="articleNo",required=true) int articleNo) {
		ModelAndView mv = new ModelAndView("route_err");
		try {
			routeService.removeRouteBoard(articleNo);
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
		}
		return mv;
	}
	
	
	@RequestMapping(value="/route_modify", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView route_modifyReg(@ModelAttribute Route route, @RequestParam("content") String content) {
		ModelAndView mv = new ModelAndView("route_post");
		try {
			int articleNo = route.getRoute_articleNo();
			route.setRoute_content(content.trim());
			routeService.updateRoutePost(route);
			routeService.updateRoutePostView(articleNo);
			RouteInfo posted = routeService.getRouteInfo(articleNo);
			mv.addObject("route", posted);
			
			Member mem = memberService.queryById(route.getUser_id());
			mv.addObject("profileImg", mem.getMemberthumb());
		} catch(Exception e) {
			e.printStackTrace();
			mv.addObject("err", e.getMessage());
		}
		return mv;
	}
	
	// 게시물 등록
	@PostMapping(value="/route_reg")
	public ModelAndView registerRoute(@ModelAttribute Route route, @RequestParam("content") String content, @RequestParam(value="route_file") MultipartFile file) throws Exception {
		ModelAndView mv = new ModelAndView("route_reg");
		String path = servletContext.getRealPath("/thumb/route/");
		File destFile = new File(path+file.getOriginalFilename());
		try {			
			file.transferTo(destFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		route.setRoute_thumb(file.getOriginalFilename());
		route.setRoute_content(content.trim());
		
		try {			
			routeService.regRoute(route);
			Member mem = memberService.queryById(route.getUser_id());
			mv.addObject("route", route);
			mv.addObject("profileImg", mem.getMemberthumb());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	//코스의 중심 좌표를 통해 주소명 받아오기
	@ResponseBody
	@PostMapping(value="/route/routeCoords")
	public static String coordToAddr(@RequestParam("longitude") double longitude, @RequestParam("latitude") double latitude){
		String url = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x="+longitude+"&y="+latitude;
		String addr = "";
		try{
			addr = getRegionAddress(getJSONData(url));
	    }catch(Exception e){
	    	System.out.println("주소 api 요청 에러");
	        e.printStackTrace();
	    }
	    return addr;
	}
	
	//코스 대표 이미지 url 
	@GetMapping(value="/routethumbfileview/{filename}")
	public void thumbfileview(@PathVariable String filename, 
			HttpServletRequest request, HttpServletResponse response)
	{			
		String path = servletContext.getRealPath("/thumb/route/");
		File file = new File(path+filename);
		String sfilename = null;
		FileInputStream fis = null;
		
		try {
			if(request.getHeader("User-Agent").indexOf("MSIE")>-1) {
				sfilename = URLEncoder.encode(file.getName(), "utf-8");
			} else {
				sfilename = new String(file.getName().getBytes("utf-8"), "ISO-8859-1");
			}
			response.setCharacterEncoding("utf-8");
			response.setContentType("application/octet-stream;charset=utf-8");
			response.setHeader("Content-Disposition", "attachment; filename="+sfilename);
			OutputStream out = response.getOutputStream();
			fis= new FileInputStream(file);
			FileCopyUtils.copy(fis, out);
			out.flush();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(fis!=null) {
				try {
					fis.close();
				} catch(Exception e) {}
			}
		}		
	}	
	
	
	// 카카오 지도 정보
	private static String getJSONData(String apiUrl) throws Exception {
		HttpURLConnection conn = null;
    	StringBuffer response = new StringBuffer();
    	String auth = "KakaoAK " + "d341cf154a7d7bd2b3ee9b196481d4be";	//인증키
    	
    	//URL 설정
        URL url = new URL(apiUrl);
        conn = (HttpURLConnection) url.openConnection();
        
        //Request 형식 설정
        conn.setRequestMethod("GET");
        conn.setRequestProperty("X-Requested-With", "curl");
        conn.setRequestProperty("Authorization", auth);

        //request에 JSON data 준비
        conn.setDoOutput(true);
        
        //보내고 결과값 받기
        int responseCode = conn.getResponseCode();
        if (responseCode == 400) {
            System.out.println("400:: 해당 명령을 실행할 수 없음");
        } else if (responseCode == 401) {
            System.out.println("401:: Authorization가 잘못됨");
        } else if (responseCode == 500) {
            System.out.println("500:: 서버 에러, 문의 필요");
        } else { // 성공 후 응답 JSON 데이터받기
        	 Charset charset = Charset.forName("UTF-8");
             BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), charset));
             String inputLine;
             while ((inputLine = br.readLine()) != null) {
             	response.append(inputLine); 
             } 
         }
         return response.toString();
    }
    
     /**
      * JSON형태의 String 데이터에서 주소값(address_name)만 받아오기
      */
	private static String getRegionAddress(String jsonString) {
        String value = "";
        JSONObject jObj = (JSONObject) JSONValue.parse(jsonString);
        System.out.println(jObj);
        JSONObject meta = (JSONObject) jObj.get("meta");
        long size = (long) meta.get("total_count");
        
        if(size>0){
            JSONArray jArray = (JSONArray) jObj.get("documents");
            JSONObject subJobj = (JSONObject) jArray.get(0);
            JSONObject address =  (JSONObject) subJobj.get("address");
            
            if(address == null){
                JSONObject subsubJobj = (JSONObject) subJobj.get("address");
                value = (String) subsubJobj.get("address_name");
            }else{
                value = (String) address.get("address_name");
            }
            
            if(value.equals("") || value==null){
                subJobj = (JSONObject) jArray.get(1);
                subJobj = (JSONObject) subJobj.get("address");
                value =(String) subJobj.get("address_name");    
            }
        }
        return value;
    }
}
