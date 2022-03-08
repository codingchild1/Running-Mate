package com.mulcam.run.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.LikesDAO;
import com.mulcam.run.dto.Likes;

@Service 
public class LikeServiceImpl implements LikesService {

	@Autowired
	LikesDAO likesDAO;
	
	@Override
	public boolean getLikesTF(String user_id, String board_type, int articleNo) throws Exception {
		Likes like = new Likes(user_id, board_type, articleNo);
		return likesDAO.selectLikes(like);
	}

}
