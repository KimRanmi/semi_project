package com.cm.user_page.dao;

import static com.cm.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cm.admin_page.vo.Inquiry;

public class MyInquiryDao {

	public int selectInquiryCount(Inquiry option, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			String sql = "SELECT COUNT(*) AS cnt FROM `inquiry_details` WHERE user_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, option.getUser_no());
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

	public List<Inquiry> selectInquiryList(Inquiry option, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Inquiry> list = new ArrayList<Inquiry>();
		try {
			String sql = "SELECT * FROM inquiry_details WHERE user_no=? ORDER BY inquiry_mod_date DESC LIMIT "+option.getLimitPageNo()+", "+option.getNumPerPage();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, option.getUser_no());
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

	public List<Inquiry> selectMyInquiry(Inquiry option, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Inquiry> list = new ArrayList<Inquiry>();
		try {
			String sql = "SELECT * FROM inquiry_details WHERE inquiry_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, option.getInquiry_no());
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

	public int editMyInquiry(Inquiry i, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			String sql = "UPDATE inquiry_details SET inquiry_title = ?, inquiry_text = ? WHERE inquiry_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, i.getInquiry_title());
			pstmt.setString(2, i.getInquiry_text());
			pstmt.setInt(3, i.getInquiry_no());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteMyInquiry(int inquiryNo, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			String sql = "DELETE FROM inquiry_details WHERE inquiry_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inquiryNo);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
