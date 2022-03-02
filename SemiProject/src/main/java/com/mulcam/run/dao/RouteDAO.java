package com.mulcam.run.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Route;

@Mapper
@Repository("routeDAO")
public interface RouteDAO {
	
	public List<Route> routeAllList(); 		//select 전체 코스 게시물
	public Route queryRoute();				//select  코스 게시물
	public List<Route> selectRoute();		//select 코스 게시물 list 기준 by 지역 & 거리
	public void updateViews();				//update 조회수
	public List<Route> selectBest3();		//select 기준 = 내 위치 orderby 3
	public void insertRoute(Route route);	//insert 코스
	public void updateRoute(Route route);	//update 코스
	public void deleteRoute();				//delete 코스
}