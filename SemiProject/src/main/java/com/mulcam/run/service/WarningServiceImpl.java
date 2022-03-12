package com.mulcam.run.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.WarningDAO;
import com.mulcam.run.dto.Warning;

@Service
public class WarningServiceImpl implements WarningService {
	@Autowired
	WarningDAO warningDAO;
	

	@Override
	public List<Warning> AllWarninglist() throws Exception {
		// TODO Auto-generated method stub
		return warningDAO.AllWarninglist();
	}


	@Override
	public void delete(String warningid) {
		// TODO Auto-generated method stub
		warningDAO.delete(warningid);
	}
	
}