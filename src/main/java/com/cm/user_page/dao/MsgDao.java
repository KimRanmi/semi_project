package com.cm.user_page.dao;

import static com.cm.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cm.admin_page.vo.Inquiry;
import com.cm.user_page.vo.Message;

public class MsgDao {

	public List<Message> selectReceivedMsgList(Message option, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Message> list = new ArrayList<Message>();
		try {
			String sql = "SELECT r.message_no, u.user_nick, u.user_id, r.sender_no, r.receiver_no, r.msg_title, r.msg_text, r.msg_reg_date, r.read_status "
			           + "FROM received_messages r "
			           + "JOIN `user` u ON r.sender_no = u.user_no "
			           + "WHERE r.receiver_no = ? ORDER BY r.msg_reg_date DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, option.getReceiver_no());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Message resultVo = new Message(rs.getInt("message_no"),
						rs.getString("user_nick"),
						rs.getString("user_id"),
						rs.getInt("sender_no"),
						rs.getInt("receiver_no"),
						rs.getString("msg_title"),
						rs.getString("msg_text"),
						rs.getTimestamp("msg_reg_date").toLocalDateTime(),
						rs.getString("read_status"));
				list.add(resultVo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int selectReceivedMsgCount(Message option, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			String sql = "SELECT COUNT(*) AS cnt FROM received_messages WHERE receiver_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, option.getReceiver_no());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public List<Message> selectSentMsgList(Message option, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Message> list = new ArrayList<Message>();
		try {
			String sql = "SELECT s.message_no, u.user_nick, u.user_id, s.sender_no, s.receiver_no, s.msg_title, s.msg_text, s.msg_reg_date, s.read_status "
					+ "FROM sent_messages s JOIN `user` u ON s.receiver_no = u.user_no "
					+ "WHERE s.sender_no = ? ORDER BY s.msg_reg_date DESC";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, option.getSender_no());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Message resultVo = new Message(rs.getInt("message_no"),
						rs.getString("user_nick"),
						rs.getString("user_id"),
						rs.getInt("sender_no"),
						rs.getInt("receiver_no"),
						rs.getString("msg_title"),
						rs.getString("msg_text"),
						rs.getTimestamp("msg_reg_date").toLocalDateTime(),
						rs.getString("read_status"));
				list.add(resultVo);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int selectSentMsgCount(Message option, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			String sql = "SELECT COUNT(*) AS cnt FROM sent_messages WHERE sender_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, option.getSender_no());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int writeMsg(Message m, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		int receiver_no = 0;
		
		try {
			String sql1 = "SELECT user_no FROM user WHERE user_nick = ?";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, m.getUser_nick());
			rs = pstmt.executeQuery();
			
			    // 조회된 결과가 있을 경우에만 senderNo 설정
			    if (rs.next()) {
			        receiver_no = rs.getInt("user_no");
			    }
			
			String sql2 = "INSERT INTO sent_messages (sender_no, receiver_no, msg_title, msg_text) VALUES (?,?,?,?)";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, m.getSender_no());
			pstmt.setInt(2, receiver_no);
			pstmt.setString(3, m.getMsg_title());
			pstmt.setString(4, m.getMsg_text());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int readMsg(Message m, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			String sql = "UPDATE received_messages SET read_status = 'Y' WHERE message_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, m.getMessage_no());
			result = pstmt.executeUpdate();
			System.out.println(m.getMessage_no());
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int[] deleteSentMsg(int[] messageNoArray, Connection conn) {
		PreparedStatement pstmt = null;
		int[] results = new int[messageNoArray.length];
		
		try {
		    String sql = "DELETE FROM sent_messages WHERE message_no = ?";
		    pstmt = conn.prepareStatement(sql);
		    
		    for (int i = 0; i < messageNoArray.length; i++) {
		        pstmt.setInt(1, messageNoArray[i]);
		        results[i] = pstmt.executeUpdate();
		    }
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return results;
	}

	public String selectMsg(int senderNo, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String receiverNick = "";
		try {
			String sql = "SELECT u.user_nick "
					+ "FROM `user` u "
					+ "JOIN received_messages r ON u.user_no = r.sender_no "
					+ "WHERE r.sender_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, senderNo);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				receiverNick = rs.getString("user_nick");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return receiverNick;
	}

	public int[] deleteReceivedMsg(int[] messageNoArray, Connection conn) {
		PreparedStatement pstmt = null;
		int[] results = new int[messageNoArray.length];
		
		try {
		    String sql = "DELETE FROM received_messages WHERE message_no = ?";
		    pstmt = conn.prepareStatement(sql);
		    
		    for (int i = 0; i < messageNoArray.length; i++) {
		        pstmt.setInt(1, messageNoArray[i]);
		        results[i] = pstmt.executeUpdate();
		    }
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return results;
	}

}
