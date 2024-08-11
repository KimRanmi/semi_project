package com.cm.user_page.service;

import static com.cm.common.sql.JDBCTemplate.close;
import static com.cm.common.sql.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.cm.admin_page.dao.InquiryDao;
import com.cm.admin_page.vo.Inquiry;
import com.cm.user_page.dao.MyInquiryDao;

public class MyInquiryService {

	public int selectInquiryCount(Inquiry option) {
		Connection conn = getConnection();
		int result = new MyInquiryDao().selectInquiryCount(option, conn);
		close(conn);
		
		return result;
	}

	public List<Inquiry> selectInquiryList(Inquiry option) {
		Connection conn = getConnection();
		
		List<Inquiry> list = new MyInquiryDao().selectInquiryList(option,conn);
		close(conn);
		return list;
	}

	public List<Inquiry> selectMyInquiry(Inquiry option) {
		Connection conn = getConnection();
		
		List<Inquiry> list = new MyInquiryDao().selectMyInquiry(option,conn);
		close(conn);
		return list;
	}

	public int editMyInquiry(Inquiry i) {
		Connection conn = getConnection();
		
		int result = new MyInquiryDao().editMyInquiry(i,conn);
		close(conn);
		return result;
	}

	public int deleteMyInquiry(int inquiryNo) {
		Connection conn = getConnection();
		
		int result = new MyInquiryDao().deleteMyInquiry(inquiryNo, conn);
		close(conn);
		return result;
	}

}
