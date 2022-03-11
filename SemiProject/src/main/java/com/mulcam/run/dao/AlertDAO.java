package com.mulcam.run.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Alert;

@Mapper
@Repository("alertDAO")
public interface AlertDAO {
	public void insertAlert(Alert alert) throws Exception;
	public void deleteAlert(int alert_no) throws Exception;
	public boolean checkAlert(Alert alert) throws Exception;
	public int selectAlertNo(Alert alert) throws Exception;
}