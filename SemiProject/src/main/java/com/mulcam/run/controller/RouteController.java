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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
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

import com.mulcam.run.dto.Route;
import com.mulcam.run.service.RouteService;


@Controller
public class RouteController {
	
	@Autowired
	RouteService routeService;
	
	@Autowired
	private ServletContext servletContext;	
	
	@GetMapping("/route")
	public ModelAndView get_routemain() {
		ModelAndView mv = new ModelAndView("route_main");
		try {
			List<Route> routeslist = routeService.allRoutesList();
			mv.addObject("routes", routeslist);
		}catch(Exception e) {
		}
		return mv;
	}
	
	@PostMapping("/route")
	public ModelAndView post_routemain() {
		ModelAndView mv = new ModelAndView("route_main");
		try {
			List<Route> routeslist = routeService.allRoutesList();
			mv.addObject("routes", routeslist);
		}catch(Exception e) {
		}
		return mv;
	}


	@GetMapping("/route_sort")
	public String route_sort() {
		return "route_sort";
	}
	
	

	@PostMapping("/route_sort")
	public String routesort() { 
		return "route_sort";
	}
	
	@PostMapping("/route_post")
	public String routepost() { 
		return "route_post";
	}
	
	@PostMapping("/route_write")
	public String routewrite() { 
		return "route_write";
	}
	
	@PostMapping(value="/route_reg")
	public ModelAndView registerRoute(@ModelAttribute Route route, @RequestParam("content") String content) {
		ModelAndView mv = new ModelAndView("route_post");
		try {			
			route.setRoute_content(content.trim());
			System.out.println(route.getRoute_area());
			routeService.regRoute(route);
			mv.addObject("route", route);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	@ResponseBody
	@PostMapping(value="/route/routeCoords")
	public static String coordToAddr(@RequestParam("longitude") double longitude, @RequestParam("latitude") double latitude){
		String url = "https://dapi.kakao.com/v2/local/geo/coord2address.json?x="+longitude+"&y="+latitude;
		System.out.println(longitude + " , " + latitude);
		
		String addr = "";
		try{
			addr = getRegionAddress(getJSONData(url));
			System.out.println("addr : " + addr);
	    }catch(Exception e){
	    	System.out.println("주소 api 요청 에러");
	        e.printStackTrace();
	    }
	    return addr;
	}
	
	private static String getJSONData(String apiUrl) throws Exception {
		HttpURLConnection conn = null;
    	StringBuffer response = new StringBuffer();
    	 
    	//인증키 - KakaoAK하고 한 칸 띄워주셔야해요!
    	String auth = "KakaoAK " + "d341cf154a7d7bd2b3ee9b196481d4be";

    	//URL 설정
        URL url = new URL(apiUrl);
         
        conn = (HttpURLConnection) url.openConnection();
        
        //Request 형식 설정
        conn.setRequestMethod("GET");
        conn.setRequestProperty("X-Requested-With", "curl");
        conn.setRequestProperty("Authorization", auth);

        //request에 JSON data 준비
        conn.setDoOutput(true);
        System.out.println(apiUrl);
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
         
        System.out.println(response);
         return response.toString();
    }
    
     /**
      * JSON형태의 String 데이터에서 주소값(address_name)만 받아오기
      */
	private static String getRegionAddress(String jsonString) {
        String value = "";
        JSONObject jObj = (JSONObject) JSONValue.parse(jsonString);
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
