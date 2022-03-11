package com.mulcam.run.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.AlertDAO;
import com.mulcam.run.dto.Alert;

@Service
public class AlertServiceImpl implements AlertService {

	@Autowired
	AlertDAO alertDAO;
	
	@Override
	public void insertAlert(String user_id, String board_type, int board_no) throws Exception {
		Alert alert = new Alert(user_id, board_type, board_no);
		alertDAO.insertAlert(alert);
	}

	@Override
	public boolean getAlertTF(String user_id, String board_type, int board_no) throws Exception {
		Alert alert = new Alert(user_id, board_type, board_no);
		return alertDAO.checkAlert(alert);
	}

	@Override
	public void deleteAlert(String user_id, String board_type, int board_no) throws Exception {
		Alert alert = new Alert(user_id, board_type, board_no);
		int alert_no = alertDAO.selectAlertNo(alert);
		alertDAO.deleteAlert(alert_no);
	}

}
