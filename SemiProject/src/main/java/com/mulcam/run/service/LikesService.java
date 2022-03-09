package com.mulcam.run.service;

public interface LikesService {
	public boolean getLikesTF(String user_id, String board_type, int articleNo) throws Exception;
}
