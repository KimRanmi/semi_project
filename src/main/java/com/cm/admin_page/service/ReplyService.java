package com.cm.admin_page.service;

import static com.cm.common.sql.JDBCTemplate.close;
import static com.cm.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.cm.admin_page.dao.InquiryDao;
import com.cm.admin_page.dao.ReplyDao;
import com.cm.admin_page.vo.Reply;

public class ReplyService {
	public List<Reply> selectReplyList(Reply option){
		Connection conn = getConnection();
		
		List<Reply> list = new ReplyDao().selectReplyList(conn);
		close(conn);
		return list;
	}
	public int createReply(Reply r) {
		Connection conn = getConnection();
		
		int result = new ReplyDao().createReply(r,conn);
		close(conn);
		return result;
	}

}
