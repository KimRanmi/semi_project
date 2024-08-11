package com.cm.user_page.service;

import static com.cm.common.sql.JDBCTemplate.close;
import static com.cm.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.cm.admin_page.dao.InquiryDao;
import com.cm.admin_page.vo.Inquiry;
import com.cm.user_page.dao.MsgDao;
import com.cm.user_page.vo.Message;

public class MsgService {

	public List<Message> selectReceivedMsgList(Message option) {
		Connection conn = getConnection();
		
		List<Message> list = new MsgDao().selectReceivedMsgList(option,conn);
		close(conn);
		return list;
	}

	public int selectReceivedMsgCount(Message option) {
		Connection conn = getConnection();
		int result = new MsgDao().selectReceivedMsgCount(option, conn);
		close(conn);
		
		return result;
	}

	public int selectSentMsgCount(Message option) {
		Connection conn = getConnection();
		int result = new MsgDao().selectSentMsgCount(option, conn);
		close(conn);
		
		return result;
	}

	public List<Message> selectSentMsgList(Message option) {
Connection conn = getConnection();
		
		List<Message> list = new MsgDao().selectSentMsgList(option,conn);
		close(conn);
		return list;
	}

	public int writeMsg(Message m) {
		Connection conn = getConnection();
		
		int result = new MsgDao().writeMsg(m,conn);
		close(conn);
		return result;
	}

	public int readMsg(Message m) {
		Connection conn = getConnection();
		int result = new MsgDao().readMsg(m, conn);
		close(conn);
		
		return result;
	}

	public int[] deleteSentMsg(int[] messageNoArray) {
		Connection conn = getConnection();
		int[] results = new MsgDao().deleteSentMsg(messageNoArray, conn);
		close(conn);
		
		return results;
	}

	public String selectMsg(int senderNo) {
		Connection conn = getConnection();
		
		String result = new MsgDao().selectMsg(senderNo, conn);
		close(conn);
		return result;
	}

	public int[] deleteReceivedMsg(int[] messageNoArray) {
		Connection conn = getConnection();
		int[] results = new MsgDao().deleteReceivedMsg(messageNoArray, conn);
		close(conn);
		
		return results;
	}
	
}
