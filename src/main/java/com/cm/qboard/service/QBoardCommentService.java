package com.cm.qboard.service;

import static com.cm.common.sql.JDBCTemplate.close;
import static com.cm.common.sql.JDBCTemplate.commit;
import static com.cm.common.sql.JDBCTemplate.getConnection;
import static com.cm.common.sql.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.cm.qboard.dao.QBoardCommentDao;
import com.cm.qboard.vo.QBoardComment;

public class QBoardCommentService {
	   public int insertComment(QBoardComment comment) {
	        Connection conn = getConnection();
	        int result = new QBoardCommentDao().insertComment(comment, conn);
	        
	        if (result > 0) {
	            commit(conn);
	        } else {
	            rollback(conn);
	        }
	        
	        close(conn);
	        return result;
	    }

	    public List<QBoardComment> selectCommentsList(int postNo) {
	        Connection conn = getConnection();
	        QBoardComment qbc = new QBoardComment();
	        qbc.setPostNo(postNo);
	        List<QBoardComment> commentList = new QBoardCommentDao().selectCommentsList(qbc, conn);
	        close(conn);
	        return commentList;
	    }
	    
	    public QBoardComment getCommentById(int commentNo) {
	        Connection conn = getConnection();
	        QBoardComment comment = new QBoardCommentDao().selectCommentById(commentNo, conn);
	        close(conn);
	        return comment;
	    }
	    
	    public boolean deleteComment(int commentNo) {
	        Connection conn = getConnection();
	        boolean result = new QBoardCommentDao().deleteComment(commentNo, conn) > 0;
	        if (result) {
	            commit(conn);
	        } else {
	            rollback(conn);
	        }
	        close(conn);
	        return result;
	    }
	    
}
