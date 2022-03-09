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

}


