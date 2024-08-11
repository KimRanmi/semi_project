package com.cm.admin_page.service;

import static com.cm.common.sql.JDBCTemplate.close;
import static com.cm.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.cm.admin_page.dao.InquiryDao;
import com.cm.admin_page.vo.Inquiry;

public class InquiryService {
	public int createInquiry(Inquiry i) {
		Connection conn = getConnection();
		
		int result = new InquiryDao().createInquiry(i,conn);
		close(conn);
		return result;
	}

	public List<Inquiry> selectInquiryList(Inquiry option) {
		Connection conn = getConnection();
		
		List<Inquiry> list = new InquiryDao().selectInquiryList(option,conn);
		close(conn);
		return list;
	}

	public int selectInquiryCount(Inquiry option) {
		Connection conn = getConnection();
		int result = new InquiryDao().selectInquiryCount(option, conn);
		close(conn);
		
		return result;
	}
}
