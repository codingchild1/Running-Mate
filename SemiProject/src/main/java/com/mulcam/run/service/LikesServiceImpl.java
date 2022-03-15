package com.mulcam.run.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.LikesDAO;
import com.mulcam.run.dto.Likes;
import com.mulcam.run.dto.Warning;

@Service 
public class LikesServiceImpl implements LikesService {

	@Autowired
	LikesDAO likesDAO;
	
	@Override
	public void insertLikes(String user_id, String board_type, int board_no) throws Exception {
		Likes like =  new Likes(user_id, board_type, board_no);
		likesDAO.insertLikes(like);
	}
	@Override
	public boolean getLikesTF(String user_id, String board_type, int board_no) throws Exception {
		Likes like = new Likes(user_id, board_type, board_no);
		return likesDAO.checkLikes(like);
	}
	@Override
	public void deleteLikes(String user_id, String board_type, int board_no) throws Exception {
		Likes like = new Likes(user_id, board_type, board_no);
		int like_no = likesDAO.selectlikesNo(like);
		likesDAO.deleteLikes(like_no);		
	}	
}
