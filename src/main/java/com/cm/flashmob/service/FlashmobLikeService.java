package com.cm.flashmob.service;

import static com.cm.common.sql.JDBCTemplate.getConnection;
import static com.cm.common.sql.JDBCTemplate.close;

import java.sql.Connection;

import com.cm.flashmob.dao.FlashmobLikeDao;
import com.cm.flashmob.vo.FlashmobLike;

public class FlashmobLikeService {
	public int like(FlashmobLike fl) {
		Connection conn = getConnection();
		int result  = new FlashmobLikeDao().like(fl,conn);
		close(conn);
		return result;
	}
}
