package com.mulcam.run.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Warning;

@Mapper
@Repository("warningDAO")
public interface WarningDAO {
	//목록
	public List<Warning> AllWarninglist() throws Exception;
	public void delete(String warningid);
	
	public void insert(Warning warning) throws Exception;
	public boolean checkWarnings(Warning warning) throws Exception;
	public void updateWarningPlus(Warning warning) throws Exception;
	public void updateWarningMinus(Warning warning) throws Exception;
	public void deleteWarning(Warning warning) throws Exception;
	public int getWarningCnt(Warning warning) throws Exception;
}


