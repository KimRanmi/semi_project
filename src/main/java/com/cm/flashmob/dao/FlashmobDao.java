package com.cm.flashmob.dao;

import static com.cm.common.sql.JDBCTemplate.close;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cm.flashmob.vo.Flashmob;

public class FlashmobDao {
	
	// 검색 기능을 구현한 리스트
	public List<Flashmob> selectFlashmobList(String sort,Flashmob option,Connection conn){
		List<Flashmob> list = new ArrayList<Flashmob>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT p.post_no,p.flashmob_location,p.flashmob_date,p.flashmob_number,p.user_no,p.board_type_id,p.local_gu_no,p.post_title,p.post_text,p.post_reg_date,p.post_mod_date,p.post_release_yn,p.flashmob_ori_image_name,p.flashmob_new_image_name,p.flashmob_post_view,COUNT(CASE WHEN l.like_status = 1 THEN l.post_no END) AS like_count,u.user_nick"
		               +" FROM flashmob_post p LEFT JOIN flashmob_like l ON p.post_no = l.post_no LEFT JOIN user u ON p.user_no = u.user_no WHERE p.post_release_yn='Y'";
		         if(option.getPost_title() != null) {
		            sql += " AND p.post_title LIKE CONCAT('%','"+option.getPost_title()+"','%')";
		         }
		         sql += " GROUP BY p.post_no, p.flashmob_location,p.flashmob_date,p.flashmob_number,p.user_no,p.board_type_id,p.local_gu_no,p.post_title,p.post_text,p.post_reg_date,p.post_mod_date,p.post_release_yn,p.flashmob_ori_image_name,p.flashmob_new_image_name,p.flashmob_post_view,u.user_nick";
			
			switch (sort) {
            case "view":
                sql += " ORDER BY p.flashmob_post_view DESC";
                break;
            case "like":
                sql += " ORDER BY like_count DESC";
                break;
            case "latest":
            default:
                sql += " ORDER BY p.post_reg_date DESC";
                break;
			}
			
			sql += " LIMIT "+option.getLimitPageNo()+", "+option.getNumPerPage();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Flashmob resultVo = new Flashmob(
						rs.getInt("post_no"),
						rs.getString("flashmob_location"),
						rs.getTimestamp("flashmob_date").toLocalDateTime(),
						rs.getInt("flashmob_number"),
						rs.getInt("user_no"),
						rs.getInt("board_type_id"),
						rs.getInt("local_gu_no"),
						rs.getString("post_title"),
						rs.getString("post_text"),
						rs.getTimestamp("post_reg_date").toLocalDateTime(),
						rs.getTimestamp("post_mod_date").toLocalDateTime(),
						rs.getString("post_release_yn"),
						rs.getInt("like_count"),
						rs.getString("flashmob_ori_image_name"),
						rs.getString("flashmob_new_image_name"),
						rs.getInt("flashmob_post_view"),
						rs.getString("user_nick")
						);
				
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
	public int selectFlashmobCount(Flashmob option,Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT COUNT(*) AS cnt FROM flashmob_post";
			if(option.getPost_title() != null) {
				sql+=" WHERE post_title LIKE CONCAT ('%','"+option.getPost_title()+"','%')";
			}
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	// 번개모임 게시판 게시글 작성
	public int createFlashmob(int boardtype,int local_gu,Flashmob f,Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO `flashmob_post` (flashmob_location,flashmob_date,flashmob_number,user_no,board_type_id,local_gu_no,post_title,post_text,post_release_yn,flashmob_ori_image_name,flashmob_new_image_name) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFlashmob_location());
			pstmt.setObject(2, f.getFlashmob_date());
			pstmt.setInt(3, f.getFlashmob_number());
			pstmt.setInt(4, f.getUser_no());
			pstmt.setInt(5, boardtype);
			pstmt.setInt(6, local_gu);
			pstmt.setString(7, f.getPost_title());
			pstmt.setString(8, f.getPost_text());
			pstmt.setString(9, f.getPost_release_yn());
			if(f.getFlashmob_ori_image_name()!=null) {
				pstmt.setString(10, f.getFlashmob_ori_image_name());
			}else {
				pstmt.setNull(10, java.sql.Types.VARCHAR);
			}
			if(f.getFlashmob_new_image_name()!=null) {
				pstmt.setString(11, f.getFlashmob_new_image_name());
			}else {
				pstmt.setNull(11, java.sql.Types.VARCHAR);
			}
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	// 글 수정
	public int editFlashmob(int postNo,int user,int boardtype,int local_gu,Flashmob f,Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		try {
			String sql = "UPDATE `flashmob_post` SET flashmob_location=? ,flashmob_date=? ,flashmob_number=? ,local_gu_no=? ,post_title=? ,post_text=? ,post_release_yn=? WHERE post_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, f.getFlashmob_location());
			pstmt.setObject(2, f.getFlashmob_date());
			pstmt.setInt(3, f.getFlashmob_number());
			pstmt.setInt(4, local_gu);
			pstmt.setString(5, f.getPost_title());
			pstmt.setString(6, f.getPost_text());
			pstmt.setString(7, f.getPost_release_yn());
			pstmt.setInt(8, postNo);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	// 상세 글 조회
	public Flashmob checkPost(int post_no,Connection conn) {
		Flashmob result = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sqlview = "UPDATE `flashmob_post` SET flashmob_post_view = flashmob_post_view + 1 WHERE post_no = ?";
			pstmt = conn.prepareStatement(sqlview);
			pstmt.setInt(1, post_no);
			int i = pstmt.executeUpdate();
			String sql = "SELECT p.post_no,p.flashmob_location,p.flashmob_date,p.flashmob_number,p.user_no,p.board_type_id,p.local_gu_no,p.post_title,p.post_text,p.post_reg_date,p.post_mod_date,p.post_release_yn,p.flashmob_ori_image_name,p.flashmob_new_image_name,p.flashmob_post_view,COUNT(CASE WHEN l.like_status = 1 THEN l.post_no END) AS like_count,u.user_nick"
					+" FROM flashmob_post p LEFT JOIN flashmob_like l ON p.post_no = l.post_no LEFT JOIN user u ON p.user_no = u.user_no WHERE p.post_no = ?"
					+" GROUP BY p.post_no, p.flashmob_location,p.flashmob_date,p.flashmob_number,p.user_no,p.board_type_id,p.local_gu_no,p.post_title,p.post_text,p.post_reg_date,p.post_mod_date,p.post_release_yn,p.flashmob_ori_image_name,p.flashmob_new_image_name,p.flashmob_post_view,u.user_nick";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = new Flashmob(
						rs.getInt("post_no"),
						rs.getString("flashmob_location"),
						rs.getTimestamp("flashmob_date").toLocalDateTime(),
						rs.getInt("flashmob_number"),
						rs.getInt("user_no"),
						rs.getInt("board_type_id"),
						rs.getInt("local_gu_no"),
						rs.getString("post_title"),
						rs.getString("post_text"),
						rs.getTimestamp("post_reg_date").toLocalDateTime(),
						rs.getTimestamp("post_mod_date").toLocalDateTime(),
						rs.getString("post_release_yn"),
						rs.getInt("like_count"),
						rs.getString("flashmob_ori_image_name"),
						rs.getString("flashmob_new_image_name"),
						rs.getInt("flashmob_post_view"),
						rs.getString("user_nick")
						);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	// 삭제하기
	public int delete(int post_no, Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			String sql = "DELETE FROM `flashmob_like` WHERE post_no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_no);
			result = pstmt.executeUpdate();
			String sql2 = "DELETE FROM `flashmob_post` WHERE post_no=?";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, post_no);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	public String getName(int post_no,Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String name=null;
		try {
			String sql = "SELECT u.user_nick FROM user u JOIN flashmob_post p ON u.user_no=p.user_no WHERE p.post_no=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, post_no);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString("user_nick");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return name;
	}
	public List<Flashmob> mywriteFlashmob(int userNo,Connection conn){
		List<Flashmob> list = new ArrayList<Flashmob>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT p.post_no,p.flashmob_location,p.flashmob_date,p.flashmob_number,p.user_no,p.board_type_id,p.local_gu_no,p.post_title,p.post_text,p.post_reg_date,p.post_mod_date,p.post_release_yn,p.flashmob_ori_image_name,p.flashmob_new_image_name,p.flashmob_post_view,COUNT(CASE WHEN l.like_status = 1 THEN l.post_no END) AS like_count,u.user_nick"
					+" FROM flashmob_post p LEFT JOIN flashmob_like l ON p.post_no = l.post_no LEFT JOIN user u ON p.user_no = u.user_no WHERE p.user_no = ?"
			+" GROUP BY p.post_no, p.flashmob_location,p.flashmob_date,p.flashmob_number,p.user_no,p.board_type_id,p.local_gu_no,p.post_title,p.post_text,p.post_reg_date,p.post_mod_date,p.post_release_yn,p.flashmob_ori_image_name,p.flashmob_new_image_name,p.flashmob_post_view,u.user_nick";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Flashmob resultVo = new Flashmob(
						rs.getInt("post_no"),
						rs.getString("flashmob_location"),
						rs.getTimestamp("flashmob_date").toLocalDateTime(),
						rs.getInt("flashmob_number"),
						rs.getInt("user_no"),
						rs.getInt("board_type_id"),
						rs.getInt("local_gu_no"),
						rs.getString("post_title"),
						rs.getString("post_text"),
						rs.getTimestamp("post_reg_date").toLocalDateTime(),
						rs.getTimestamp("post_mod_date").toLocalDateTime(),
						rs.getString("post_release_yn"),
						rs.getInt("like_count"),
						rs.getString("flashmob_ori_image_name"),
						rs.getString("flashmob_new_image_name"),
						rs.getInt("flashmob_post_view"),
						rs.getString("user_nick")
						);
				
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
	public List<Flashmob> mylikeFlashmob(int userNo,Connection conn){
		List<Flashmob> list = new ArrayList<Flashmob>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT p.post_no,p.flashmob_location,p.flashmob_date,p.flashmob_number,p.user_no,p.board_type_id,p.local_gu_no,p.post_title,p.post_text,p.post_reg_date,p.post_mod_date,p.post_release_yn,p.flashmob_ori_image_name,p.flashmob_new_image_name,p.flashmob_post_view,COUNT(CASE WHEN l.like_status = 1 THEN l.post_no END) AS like_count,u.user_nick"
					+" FROM flashmob_post p LEFT JOIN flashmob_like l ON p.post_no = l.post_no LEFT JOIN user u ON p.user_no = u.user_no WHERE l.like_status = 1 AND l.like_user_no=?"
			+" GROUP BY p.post_no, p.flashmob_location,p.flashmob_date,p.flashmob_number,p.user_no,p.board_type_id,p.local_gu_no,p.post_title,p.post_text,p.post_reg_date,p.post_mod_date,p.post_release_yn,p.flashmob_ori_image_name,p.flashmob_new_image_name,p.flashmob_post_view,u.user_nick";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Flashmob resultVo = new Flashmob(
						rs.getInt("post_no"),
						rs.getString("flashmob_location"),
						rs.getTimestamp("flashmob_date").toLocalDateTime(),
						rs.getInt("flashmob_number"),
						rs.getInt("user_no"),
						rs.getInt("board_type_id"),
						rs.getInt("local_gu_no"),
						rs.getString("post_title"),
						rs.getString("post_text"),
						rs.getTimestamp("post_reg_date").toLocalDateTime(),
						rs.getTimestamp("post_mod_date").toLocalDateTime(),
						rs.getString("post_release_yn"),
						rs.getInt("like_count"),
						rs.getString("flashmob_ori_image_name"),
						rs.getString("flashmob_new_image_name"),
						rs.getInt("flashmob_post_view"),
						rs.getString("user_nick")
						);
				
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
	public List<Flashmob> myjoinFlashmob(int userNo,Connection conn){
		List<Flashmob> list = new ArrayList<Flashmob>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT p.post_no,p.flashmob_location,p.flashmob_date,p.flashmob_number,p.user_no,p.board_type_id,p.local_gu_no,p.post_title,p.post_text,p.post_reg_date,p.post_mod_date,p.post_release_yn,p.flashmob_ori_image_name,p.flashmob_new_image_name,p.flashmob_post_view,COUNT(CASE WHEN l.like_status = 1 THEN l.post_no END) AS like_count,u.user_nick"
					+" FROM flashmob_post p LEFT JOIN flashmob_like l ON p.post_no = l.post_no LEFT JOIN user u ON p.user_no = u.user_no LEFT JOIN flashmob_application a ON p.post_no = a.post_no WHERE a.accept_status = 'Y' AND a.user_no=?"
			+" GROUP BY p.post_no, p.flashmob_location,p.flashmob_date,p.flashmob_number,p.user_no,p.board_type_id,p.local_gu_no,p.post_title,p.post_text,p.post_reg_date,p.post_mod_date,p.post_release_yn,p.flashmob_ori_image_name,p.flashmob_new_image_name,p.flashmob_post_view,u.user_nick";

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Flashmob resultVo = new Flashmob(
						rs.getInt("post_no"),
						rs.getString("flashmob_location"),
						rs.getTimestamp("flashmob_date").toLocalDateTime(),
						rs.getInt("flashmob_number"),
						rs.getInt("user_no"),
						rs.getInt("board_type_id"),
						rs.getInt("local_gu_no"),
						rs.getString("post_title"),
						rs.getString("post_text"),
						rs.getTimestamp("post_reg_date").toLocalDateTime(),
						rs.getTimestamp("post_mod_date").toLocalDateTime(),
						rs.getString("post_release_yn"),
						rs.getInt("like_count"),
						rs.getString("flashmob_ori_image_name"),
						rs.getString("flashmob_new_image_name"),
						rs.getInt("flashmob_post_view"),
						rs.getString("user_nick")
						);
				
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
	public List<Flashmob> popularFlashmob(Connection conn) {
		List<Flashmob> list = new ArrayList<Flashmob>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT p.post_no,p.flashmob_location,p.flashmob_date,p.flashmob_number,p.user_no,p.board_type_id,p.local_gu_no,p.post_title,p.post_text,p.post_reg_date,p.post_mod_date,p.post_release_yn,p.flashmob_ori_image_name,p.flashmob_new_image_name,p.flashmob_post_view,COUNT(CASE WHEN l.like_status = 1 THEN l.post_no END) AS like_count,u.user_nick"
					+ " FROM flashmob_post p LEFT JOIN flashmob_like l ON p.post_no = l.post_no LEFT JOIN user u ON p.user_no = u.user_no  GROUP BY p.post_no, p.flashmob_location,p.flashmob_date,p.flashmob_number,p.user_no,p.board_type_id,p.local_gu_no,p.post_title,p.post_text,p.post_reg_date,p.post_mod_date,p.post_release_yn,p.flashmob_ori_image_name,p.flashmob_new_image_name,p.flashmob_post_view,u.user_nick"
					+ " ORDER BY like_count DESC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Flashmob resultVo = new Flashmob(
						rs.getInt("post_no"),
						rs.getString("flashmob_location"),
						rs.getTimestamp("flashmob_date").toLocalDateTime(),
						rs.getInt("flashmob_number"),
						rs.getInt("user_no"),
						rs.getInt("board_type_id"),
						rs.getInt("local_gu_no"),
						rs.getString("post_title"),
						rs.getString("post_text"),
						rs.getTimestamp("post_reg_date").toLocalDateTime(),
						rs.getTimestamp("post_mod_date").toLocalDateTime(),
						rs.getString("post_release_yn"),
						rs.getInt("like_count"),
						rs.getString("flashmob_ori_image_name"),
						rs.getString("flashmob_new_image_name"),
						rs.getInt("flashmob_post_view"),
						rs.getString("user_nick")
						);
				
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
	
	
}
