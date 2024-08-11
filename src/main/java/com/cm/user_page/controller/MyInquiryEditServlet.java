package com.cm.user_page.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.admin_page.vo.Inquiry;
import com.cm.user_page.service.MyInquiryService;

@WebServlet("/user/editMyInquiry")
public class MyInquiryEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyInquiryEditServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // inquiry_no 파라미터 받기
        String inquiryNoStr = request.getParameter("inquiryNo");
        int inquiryNo = Integer.parseInt(inquiryNoStr);
        
		Inquiry option = new Inquiry();
		option.setInquiry_no(inquiryNo);
        
        List<Inquiry> list = new MyInquiryService().selectMyInquiry(option);

        // JSP로 forward
		RequestDispatcher view = request.getRequestDispatcher("/views/user_page/myinquiry_edit.jsp");
		request.setAttribute("list", list); // list를 attribute로 설정
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
