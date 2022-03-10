package com.mulcam.run.service;

public interface LikesService {
	public void insertLikes(String user_id, String board_type, int board_no) throws Exception;
	public boolean getLikesTF(String user_id, String board_type, int articleNo) throws Exception;
	public void deleteLikes(String user_id, String board_type, int articleNo) throws Exception;
}