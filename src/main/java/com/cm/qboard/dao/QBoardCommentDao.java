package com.cm.qboard.dao;

import static com.cm.common.sql.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.cm.qboard.vo.QBoardComment;
import com.cm.user.vo.User;

public class QBoardCommentDao {
	public int insertComment(QBoardComment comment, Connection conn) {
        PreparedStatement pstmt = null;
        int result = 0;        
        try {
        	String sql = "INSERT INTO question_comment (post_no, user_no, comment_text) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, comment.getPostNo());
            pstmt.setInt(2, comment.getUserNo());
            pstmt.setString(3, comment.getCommentText());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        
        return result;
    }

    public List<QBoardComment> selectCommentsList(QBoardComment qbc, Connection conn) {
        List<QBoardComment> commentList = new ArrayList<QBoardComment>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT qc.*, u.user_nick FROM question_comment qc " +
                         "JOIN user u ON qc.user_no = u.user_no " +
                         "WHERE qc.post_no = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, qbc.getPostNo());
            rs = pstmt.executeQuery();

            while (rs.next()) {
                QBoardComment comment = new QBoardComment();
                comment.setCommentNo(rs.getInt("comment_no"));
                comment.setPostNo(rs.getInt("post_no"));
                comment.setUserNo(rs.getInt("user_no"));
                comment.setCommentText(rs.getString("comment_text"));
                comment.setCommentRegDate(rs.getTimestamp("comment_reg_date").toLocalDateTime());
                comment.setCommentModDate(rs.getTimestamp("comment_mod_date").toLocalDateTime());

                User user = new User();
                user.setUser_nick(rs.getString("user_nick"));
                user.setUser_no(rs.getInt("user_no"));
                comment.setUser(user);

                commentList.add(comment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return commentList;
    }

    
    public int deleteComment(int commentNo, Connection conn) {
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            String sql = "DELETE FROM question_comment WHERE comment_no = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, commentNo);
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        return result;
    }
    
    public QBoardComment selectCommentById(int commentNo, Connection conn) {
        QBoardComment comment = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT qc.*, u.user_nick, u.user_no " +
                    "FROM question_comment qc " +
                    "JOIN user u ON qc.user_no = u.user_no " +
                    "WHERE qc.comment_no = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, commentNo);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                comment = new QBoardComment();
                comment.setCommentNo(rs.getInt("comment_no"));
                comment.setPostNo(rs.getInt("post_no"));
                comment.setUserNo(rs.getInt("user_no"));
                comment.setCommentText(rs.getString("comment_text"));
                comment.setCommentRegDate(rs.getTimestamp("comment_reg_date").toLocalDateTime());
                comment.setCommentModDate(rs.getTimestamp("comment_mod_date").toLocalDateTime());
                
                User user = new User();
                user.setUser_no(rs.getInt("user_no"));
                user.setUser_nick(rs.getString("user_nick"));
                comment.setUser(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }

        return comment;
    }
    
}
