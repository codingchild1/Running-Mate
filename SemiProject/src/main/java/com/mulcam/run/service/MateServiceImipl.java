package com.mulcam.run.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.MateDAO;
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
		// TODO Auto-generated method stub
		return null;
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
	public int viewsMate(int mate_articleNO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int viewsGroup(int group_articleNO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
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
	public Warning makeWarning(Warning warning) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Ptp> ptpInfo(int mate_articleNO) throws Exception {
		return mateDAO.ptpInfo(mate_articleNO);
	}
	
//	@Override
//	public Ptp ptpInfo(int mate_articleNO) throws Exception {
//		return mateDAO.ptpInfo(mate_articleNO);
//	}

	@Override
	public void like(int mate_articleNO) throws Exception {
			mateDAO.like(mate_articleNO);
//			mateDAO.insertptp(mate_articleNO);
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
//		mateDAO.searchList(map);
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


//	@Override
//	public Ptp ptpInfo(int mate_articleNO, String user_id) throws Exception {
//		Map<String,Object> ptp = new HashMap<>();
//		ptp.put("mate_articleNO",mate_articleNO);
//		ptp.put("user_id",user_id);
//		if(ptp==null) throw new Exception("정보 없음");
//		return (com.mulcam.run.dto.Ptp) ptp;
//	}
}

