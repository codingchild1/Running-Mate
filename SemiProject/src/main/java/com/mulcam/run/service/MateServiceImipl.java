package com.mulcam.run.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.MateDAO;
import com.mulcam.run.dto.Alert;
import com.mulcam.run.dto.Group;
import com.mulcam.run.dto.GroupAndMate;
import com.mulcam.run.dto.Mate;
import com.mulcam.run.dto.Ptp;
import com.mulcam.run.dto.Warning;

@Service
public class MateServiceImipl implements MateService {

		
	@Autowired
	MateDAO mateDAO;
	
	@Override
	public List<GroupAndMate> allpostInfo() throws Exception {
		return mateDAO.postList();
	}
	
	@Override
	public List<Mate> allMateInfo() throws Exception {
		return mateDAO.mateList();
	}

	@Override
	public List<Group> allGroupInfo() throws Exception {
		return mateDAO.groupList();
	}

	@Override
	public Mate mateInfo(int mate_articleNO) throws Exception {
		return mateDAO.queryMate(mate_articleNO);
		
	}

	@Override
	public Group groupInfo(int group_articleNO) throws Exception {
		return mateDAO.queryGroup(group_articleNO);
	}

	@Override
	public void updateMate(Mate mate) throws Exception {
		mateDAO.updateMate(mate);
	}

	@Override
	public void updateGroup(Group group) throws Exception {
		mateDAO.updateGroup(group);
		System.out.println("service");
	}

	@Override
	public void removeMate(int mate_articleNO) throws Exception {
		mateDAO.deleteMate(mate_articleNO);
	}

	@Override
	public void removeGroup(int group_articleNO) throws Exception {
		mateDAO.deleteGroup(group_articleNO);
	}
	
	@Override
	public void makeMate(Mate mate) throws Exception {
		mateDAO.insertMate(mate);
	}
	
	@Override
	public void makeGroup(Group group) throws Exception {
		mateDAO.insertGroup(group);
		
	}

	@Override
	public List<Ptp> ptpInfo(int mate_articleNO) throws Exception {
		return mateDAO.ptpInfo(mate_articleNO);
	}
	

	@Override
	public void like(int mate_articleNO) throws Exception {
			mateDAO.like(mate_articleNO);
	}

	@Override
	public void likeCancel(int mate_articleNO) throws Exception {
		mateDAO.likeCancel(mate_articleNO);
	}

	@Override
	public void makePtp(int mate_articleNO, String user_id) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("mate_articleNO", mate_articleNO);
		mateDAO.insertptp(map);
	}

	@Override
	public void deletePtp(int mate_articleNO, String user_id) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("mate_articleNO", mate_articleNO);
		mateDAO.deleteptp(map);
		
	}

	@Override
	public Boolean likequery(int mate_articleNO, String user_id) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("user_id", user_id);
		map.put("mate_articleNO", mate_articleNO);
		Ptp ptp = mateDAO.ptpInfo2(map);
		if(ptp==null||mate_articleNO==ptp.getMate_articleNO()&&!user_id.equals(ptp.getUser_id())) return false;
		return true;
	}

	@Override
	public List<GroupAndMate> searchInfo(String type, String option, String input) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("type", type);
		map.put("option", option);
		map.put("input", input);
		System.out.println(type+" "+option+" "+input);
		return mateDAO.searchList(map);
	}

	@Override
	public List<GroupAndMate> searchInfoAll(String option, String input) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("option", option);
		map.put("input", input);
		return mateDAO.searchListAll(map);
	}

	@Override
	public List<String> allMapInfo() throws Exception {
		return mateDAO.searchmapInfo();
	}

	@Override
	public List<String> allTitleInfo() throws Exception {
		return mateDAO.searchtitleInfo();
	}

	@Override
	public List<GroupAndMate> addressinfo(String input) throws Exception {
		return mateDAO.searchMap(input);
	}

	@Override
	public List<GroupAndMate> addressinfo2(String type, String input) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("type", type);
		map.put("input", input);
		return mateDAO.searchMap2(map);
	}

	@Override
	public List<GroupAndMate> addressinfo3(String type) throws Exception {
		return mateDAO.searchMap3(type);
	}

	@Override
	public void mateWarning(int mate_articleNO) throws Exception {
		mateDAO.mateWarning(mate_articleNO);
		
	}

	@Override
	public void groupWarning(int group_articleNO) throws Exception {
		mateDAO.groupWarning(group_articleNO);
		
	}

	@Override
	public void mateWarningCanc(int mate_articleNO) throws Exception {
		mateDAO.mateWarningCanc(mate_articleNO);
		
	}

	@Override
	public void groupWarningCanc(int group_articleNO) throws Exception {
		mateDAO.groupWarningCanc(group_articleNO);
		
	}

	@Override
	public boolean checkptp(String user_id, int mate_articleNO) throws Exception {
		Ptp ptp = new Ptp(mate_articleNO,user_id);
		boolean check = mateDAO.checkPtp(ptp);
		return check;
	}

}

