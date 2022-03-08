package com.mulcam.run.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.data.relational.core.sql.Like;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Likes;

@Mapper
@Repository("likesDAO")
public interface LikesDAO {
	public void insertLikes(Likes like) throws Exception;
	public boolean selectLikes(Likes like) throws Exception;
}
