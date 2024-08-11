package com.cm.user_page.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.admin_page.vo.Inquiry;
import com.cm.user_page.service.MyInquiryService;

@WebServlet("/user/editEndMyInquiry")
public class MyInquiryEditEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyInquiryEditEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inquiryNoStr = request.getParameter("inquiryNo");
		int inquiryNo = Integer.parseInt(inquiryNoStr);
		String title = request.getParameter("inquiry_title");
		String text = request.getParameter("inquiry_text");
		
		Inquiry i = new Inquiry();
		i.setInquiry_no(inquiryNo);
		i.setInquiry_title(title);
		i.setInquiry_text(text);
		
		int result = new MyInquiryService().editMyInquiry(i);
		
		if(result > 0) {
			response.sendRedirect("/myInquiryboard/list");
		} 

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
