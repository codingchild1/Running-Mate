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


	@Override
	public void insert(String board_type, int board_no, String warning_id) throws Exception {
		Warning warning = new Warning(board_type, board_no, warning_id);
		boolean waringExist = warningDAO.checkWarnings(warning);
		System.out.println(waringExist);
		if(waringExist) {
			System.out.println("update");
			warningDAO.updateWarningPlus(warning);
			
		}else {
			System.out.println("insert");
			warningDAO.insert(warning);
			
		}
	}
	
	@Override
	public void cancel(String board_type, int board_no, String warning_id) throws Exception {
		Warning warning = new Warning(board_type, board_no, warning_id);
		boolean waringExist = warningDAO.checkWarnings(warning);
		if(waringExist) {
			warningDAO.updateWarningMinus(warning);
			int warningcnt = warningDAO.getWarningCnt(warning);
			if(warningcnt<1) warningDAO.deleteWarning(warning);
		}
	}




	
	
}
