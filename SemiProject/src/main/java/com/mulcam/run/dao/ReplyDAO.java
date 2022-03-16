package com.mulcam.run.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.mulcam.run.dto.Reply;
import com.mulcam.run.dto.ReplyInfo;

@Mapper
@Repository("replyDAO")
public interface ReplyDAO {
	public void insert(Reply reply) throws Exception;
	public List<Reply> replyList(ReplyInfo replyinfo) throws Exception;
	public void delete(int reply_no) throws Exception;
	public void update(ReplyInfo replyinfo) throws Exception;
}
