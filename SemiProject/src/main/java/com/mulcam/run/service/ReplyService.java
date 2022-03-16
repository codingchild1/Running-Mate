package com.mulcam.run.service;

import java.util.List;

import com.mulcam.run.dto.Reply;
import com.mulcam.run.dto.ReplyInfo;

public interface ReplyService {
	public void insertReply(Reply reply) throws Exception;
	public List<Reply> replyList(ReplyInfo relyinfo) throws Exception;
	public void updateReply(ReplyInfo relyinfo)  throws Exception;
	public void deleteReply(int reply_no)  throws Exception;
}
