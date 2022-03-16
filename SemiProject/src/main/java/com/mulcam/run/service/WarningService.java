package com.mulcam.run.service;

import java.util.List;

import com.mulcam.run.dto.Warning;

public interface WarningService {
	//신고 리스트
	public List<Warning> AllWarninglist() throws Exception;

	public void delete(String warningid);
	
	public void insert(String board_type, int board_no, String warning_id) throws Exception;
	public void cancel(String board_type, int board_no, String warning_id) throws Exception;
	
}
