package com.cm.admin_page.dao;

import static com.cm.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cm.admin_page.vo.Inquiry;

public class InquiryDao {

	public int createInquiry(Inquiry i, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			String sql = "INSERT INTO `inquiry_details` (user_no,inquiry_title,inquiry_text) VALUES (?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i.getUser_no());
			pstmt.setString(2, i.getInquiry_title());
			pstmt.setString(3, i.getInquiry_text());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public List<Inquiry> selectInquiryList(Inquiry option, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Inquiry> list = new ArrayList<Inquiry>();
		try {
			String sql = "SELECT * FROM inquiry_details ORDER BY inquiry_no DESC LIMIT "+option.getLimitPageNo()+", "+option.getNumPerPage();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Inquiry resultVo = new Inquiry(rs.getInt("inquiry_no"),
						rs.getInt("user_no"),
						rs.getString("inquiry_title"),
						rs.getString("inquiry_text"),
						rs.getTimestamp("inquiry_reg_date").toLocalDateTime(),
						rs.getTimestamp("inquiry_mod_date").toLocalDateTime(),
						rs.getString("reply_status"));
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

	public int selectInquiryCount(Inquiry option, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			String sql = "SELECT COUNT(*) AS cnt FROM `inquiry_details`";
			pstmt = conn.prepareStatement(sql);
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
}


