package com.mulcam.run.service;

import java.util.List;

import com.mulcam.run.dto.Warning;

public interface WarningService {
	//신고 리스트
	public List<Warning> AllWarninglist() throws Exception;
	//신고 삭제
	void deleteWarning(Warning warning) throws Exception;

}
