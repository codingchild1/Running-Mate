package com.mulcam.run.service;

import org.springframework.stereotype.Service;

public interface AlertService {
	public void insertAlert(String user_id, String board_type, int board_no) throws Exception;
	public boolean getAlertTF(String user_id, String board_type, int board_no) throws Exception;
	public void deleteAlert(String user_id, String board_type, int board_no) throws Exception;

}
