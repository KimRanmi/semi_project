package com.cm.flashmob.dao;
import static com.cm.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.cm.flashmob.vo.FlashmobApply;

public class FlashmobApplyDao {
	public int createApply(FlashmobApply fa,Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		try {
			String sql = "SELECT * FROM flashmob_application WHERE post_no=? AND user_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fa.getPost_no());
			pstmt.setInt(2, fa.getUser_no());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result = 0;
			}else {
				String sql2 = "INSERT INTO `flashmob_application` (post_no,user_no,application_text) VALUES (?,?,?)";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, fa.getPost_no());
				pstmt.setInt(2, fa.getUser_no());
				pstmt.setString(3, fa.getApplication_text());
				
				result = pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	
	public List<FlashmobApply> checklist(int postNo, Connection conn){
		List<FlashmobApply> list = new ArrayList<FlashmobApply>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT u.user_nick ,a.application_text ,a.application_date, a.application_no, a.post_no, a.user_no, a.accept_status, a.accept_date FROM flashmob_application a LEFT JOIN user u ON a.user_no=u.user_no WHERE a.post_no=? AND a.accept_status IS NULL";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, postNo);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			    Timestamp applicationDate = rs.getTimestamp("application_date");
			    Timestamp acceptDate = rs.getTimestamp("accept_date");

			    FlashmobApply resultVo = new FlashmobApply(
			            rs.getInt("application_no"),
			            rs.getInt("post_no"),
			            rs.getInt("user_no"),
			            rs.getString("application_text"),
			            rs.getString("accept_status"),
			            applicationDate != null ? applicationDate.toLocalDateTime() : null,
			            acceptDate != null ? acceptDate.toLocalDateTime() : null,
			            rs.getString("user_nick")
			    );
			    list.add(resultVo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public List<FlashmobApply> showList(int post_no,Connection conn){
		List<FlashmobApply> showList = new ArrayList<FlashmobApply>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT u.user_nick ,a.application_text ,a.application_date, a.application_no, a.post_no, a.user_no, a.accept_status, a.accept_date FROM flashmob_application a LEFT JOIN user u ON a.user_no=u.user_no WHERE a.post_no=? AND a.accept_status='Y'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_no);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			    Timestamp applicationDate = rs.getTimestamp("application_date");
			    Timestamp acceptDate = rs.getTimestamp("accept_date");

			    FlashmobApply resultVo = new FlashmobApply(
			            rs.getInt("application_no"),
			            rs.getInt("post_no"),
			            rs.getInt("user_no"),
			            rs.getString("application_text"),
			            rs.getString("accept_status"),
			            applicationDate != null ? applicationDate.toLocalDateTime() : null,
			            acceptDate != null ? acceptDate.toLocalDateTime() : null,
			            rs.getString("user_nick")
			    );
			    showList.add(resultVo);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return showList;
	}
	
	public int accept(String yn, int app_no, Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			String sql = "UPDATE `flashmob_application` SET accept_status=? WHERE application_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, yn);
			pstmt.setInt(2, app_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
	            result = rs.getInt(1);
	        }
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	public int count(int post_no,Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		try {
			String sql = "SELECT COUNT(*) FROM flashmob_application WHERE post_no=? AND accept_status='Y'";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, post_no);
			rs=pstmt.executeQuery();
			if (rs.next()) {
	            result = rs.getInt(1);
	        }
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
		
		
	}
}
