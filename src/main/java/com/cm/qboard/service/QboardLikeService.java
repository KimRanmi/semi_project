package com.cm.qboard.service;
import static com.cm.common.sql.JDBCTemplate.*;
import static com.cm.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.cm.qboard.dao.QboardLikeDao;
import com.cm.qboard.vo.QBoardLike;

public class QboardLikeService {
	public int like(QBoardLike bl) {
	      Connection conn = getConnection();
	      int result  = new QboardLikeDao().like(bl,conn);
	      System.out.println("서비스like"+result);
	      System.out.println("서비스bl"+bl);
	      close(conn);
	      return result;
	   }
}
