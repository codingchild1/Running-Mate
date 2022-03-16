package com.mulcam.run.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Likes;

@Mapper
@Repository("likesDAO")
public interface LikesDAO {
	public void insertLikes(Likes like) throws Exception;
	public void deleteLikes(int likes_no) throws Exception;
	public boolean checkLikes(Likes like) throws Exception;
	public int selectlikesNo(Likes like) throws Exception;
}
