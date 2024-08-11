package com.cm.qboard.service;

import static com.cm.common.sql.JDBCTemplate.close;
import static com.cm.common.sql.JDBCTemplate.commit;
import static com.cm.common.sql.JDBCTemplate.getConnection;
import static com.cm.common.sql.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.cm.qboard.dao.QBoardDao;
import com.cm.qboard.vo.QBoard;

public class QBoardService {
	
    public int createBoard(QBoard qb) {
        Connection conn = getConnection();
        int result = new QBoardDao().createBoard(qb, conn);
        if (result > 0) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
        return result;
    }
    
    public List<QBoard> getUserPosts(int userNo) {
        Connection conn = getConnection();
        List<QBoard> list = new QBoardDao().selectUserPosts(userNo, conn);
        close(conn);
        return list;
    }
    
    public List<QBoard> getLikedPosts(int userNo) {
        Connection conn = getConnection();
        List<QBoard> list = new QBoardDao().selectLikedPosts(userNo, conn);
        close(conn);
        return list;
    }
    
    public List<QBoard> getPostsByUser(int userNo) {
        Connection conn = getConnection();
        List<QBoard> list = new QBoardDao().selectPostsByUser(userNo, conn);
        close(conn);
        return list;
    }
	
    public int selectBoardCount(QBoard qb) {
        Connection conn = getConnection();
        int result = new QBoardDao().selectBoardCount(qb, conn);
        close(conn);
        return result;
    }
	
	
    public List<QBoard> getQBoardList(String sort, int nowPage, int numPerPage, QBoard qb) {
        Connection conn = getConnection();
        List<QBoard> list = new QBoardDao().selectBoardList(qb, sort, nowPage, numPerPage, conn);
        close(conn);
        return list;
    }

	
    public QBoard getQBoard(int postNo) {
        Connection conn = getConnection();
        QBoard result = new QBoardDao().getQBoard(postNo, conn);
        if (result == null) {
            System.out.println("Service: QBoard object is null");
        } else {
            System.out.println("Service: QBoard object is not null");
        }
        close(conn);
        return result;
    }
	
    public int getQBoardCount() {
        Connection conn = getConnection();
        int result = new QBoardDao().selectBoardCount(new QBoard(), conn);
        close(conn);
        return result;
    }
	
    public int updateBoard(QBoard qb) {
        Connection conn = getConnection();
        int result = new QBoardDao().updateBoard(qb, conn);
        System.out.println("Transaction started");
        System.out.println("update"+result);
        System.out.println("servie"+qb);
        if (result > 0) {
            commit(conn);
            System.out.println("Transaction committed");
        } else {
            rollback(conn);
            System.out.println("Transaction rolled back");
        }
        close(conn);
        return result;
    }


    public boolean deleteBoard(int postNo) {
        Connection conn = getConnection();
        boolean result = new QBoardDao().deleteBoard(postNo, conn);
        if (result) {
            commit(conn);
        } else {
            rollback(conn);
        }
        close(conn);
        return result;
    }
    
}
