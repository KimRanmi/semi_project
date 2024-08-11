package com.cm.flashmob.service;
import static com.cm.common.sql.JDBCTemplate.close;
import static com.cm.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.cm.flashmob.dao.FlashmobApplyDao;
import com.cm.flashmob.vo.FlashmobApply;

public class FlashmobApplyService {
	public int createApply(FlashmobApply fa) {
		Connection conn = getConnection();
		int result = new FlashmobApplyDao().createApply(fa,conn);
		close(conn);
		return result;
	}
	public List<FlashmobApply> checklist(int postNo){
		Connection conn = getConnection();
		List<FlashmobApply> list = new FlashmobApplyDao().checklist(postNo,conn);
		close(conn);
		return list;
	}
	public int accept(String yn,int app_no) {
		Connection conn = getConnection();
		int result = new FlashmobApplyDao().accept(yn,app_no,conn);
		close(conn);
		return result;
	}
	public List<FlashmobApply> showList(int post_no){
		Connection conn = getConnection();
		List<FlashmobApply> showList = new FlashmobApplyDao().showList(post_no,conn);
		close(conn);
		return showList;
	}
	public int count(int post_no) {
		Connection conn = getConnection();
		int result = new FlashmobApplyDao().count(post_no,conn);
		close(conn);
		return result;
	}
}
