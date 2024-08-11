package com.cm.qboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import com.cm.qboard.vo.QBoardLike;
import static com.cm.common.sql.JDBCTemplate.close;

public class QboardLikeDao {
    public int like(QBoardLike bl, Connection conn) {
        int result = 0;
        int status = 1;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM `question_like` WHERE post_no=? AND user_no=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bl.getPost_no());
            pstmt.setInt(2, bl.getUser_no());

            System.out.println("Executing query: " + pstmt);
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

                String sql1 = "UPDATE `question_like` SET like_status=? WHERE post_no=? AND user_no=?";
                pstmt = conn.prepareStatement(sql1);
                pstmt.setInt(1, status);
                pstmt.setInt(2, bl.getPost_no());
                pstmt.setInt(3, bl.getUser_no());
                System.out.println("Executing query1: " + pstmt);
                result = pstmt.executeUpdate();
                System.out.println("Update result1: " + result);

            } else {
                rs.close();
                pstmt.close();

                String sql2 = "INSERT INTO `question_like` (post_no, user_no, like_status) VALUES (?,?,?)";
                pstmt = conn.prepareStatement(sql2);
                pstmt.setInt(1, bl.getPost_no());
                pstmt.setInt(2, bl.getUser_no());
                pstmt.setInt(3, status);
                System.out.println("Executing query2: " + pstmt);
                result = pstmt.executeUpdate();
                System.out.println("Insert result2: " + result);

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
