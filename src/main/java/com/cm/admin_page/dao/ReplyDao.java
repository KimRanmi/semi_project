package com.cm.admin_page.dao;

import static com.cm.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cm.admin_page.vo.Inquiry;
import com.cm.admin_page.vo.Reply;

public class ReplyDao {

	public List<Reply> selectReplyList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Reply> list = new ArrayList<Reply>();
		try {
			String sql = "SELECT * FROM reply_details;";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reply resultVo = new Reply(rs.getInt("reply_no"),
						rs.getInt("inquiry_no"),
						rs.getString("reply_text"),
						rs.getTimestamp("reply_reg_date").toLocalDateTime(),
						rs.getTimestamp("reply_mod_date").toLocalDateTime());
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
	
	public int createReply(Reply r, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			String sql = "INSERT INTO `reply_details` (`inquiry_no`,`reply_text`) VALUES (?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, r.getInquiry_no());
			pstmt.setString(2, r.getReply_text());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
