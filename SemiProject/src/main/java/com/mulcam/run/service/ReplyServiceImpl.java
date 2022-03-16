package com.mulcam.run.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.ReplyDAO;
import com.mulcam.run.dto.Reply;
import com.mulcam.run.dto.ReplyInfo;

@Service 
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	ReplyDAO replyDAO;
	
	public void insertReply(Reply reply) throws Exception{
		replyDAO.insert(reply);
	}

	@Override
	public List<Reply> replyList(ReplyInfo relyinfo) throws Exception {
		return replyDAO.replyList(relyinfo);
	}

	
	@Override
	public void deleteReply(int reply_no) throws Exception {
		replyDAO.delete(reply_no);
	}

	@Override
	public void updateReply(ReplyInfo relyinfo) throws Exception {
		replyDAO.update(relyinfo);
	}
	
}
