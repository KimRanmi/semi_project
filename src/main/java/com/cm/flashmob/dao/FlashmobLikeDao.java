package com.cm.flashmob.dao;

import static com.cm.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cm.flashmob.vo.FlashmobLike;

public class FlashmobLikeDao {
	public int like(FlashmobLike fl, Connection conn) {
		int result = 0;
		int status=1;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * FROM `flashmob_like` WHERE post_no=? AND like_user_no=?";
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, fl.getPost_no());
	        pstmt.setInt(2, fl.getLike_user_no());
	        rs = pstmt.executeQuery();
	        
	        if (rs.next()) {
	            status = rs.getInt("like_status");
	            if (status == 1) {
	                status = 0;
	            } else {
	                status = 1;
	            }
	            rs.close();
	            pstmt.close();
	            
	            String sql1 = "UPDATE `flashmob_like` SET like_status=? WHERE post_no=? AND like_user_no=?";
	            pstmt = conn.prepareStatement(sql1);
	            pstmt.setInt(1, status);
	            pstmt.setInt(2, fl.getPost_no());
	            pstmt.setInt(3, fl.getLike_user_no());
	            result = pstmt.executeUpdate();
	            
	        } else {
	            rs.close();
	            pstmt.close();
	            
	            String sql2 = "INSERT INTO `flashmob_like` (post_no, like_user_no, like_status) VALUES (?,?,?)";
	            pstmt = conn.prepareStatement(sql2);
	            pstmt.setInt(1, fl.getPost_no());
	            pstmt.setInt(2, fl.getLike_user_no());
	            pstmt.setInt(3, status);
	            result = pstmt.executeUpdate();
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
