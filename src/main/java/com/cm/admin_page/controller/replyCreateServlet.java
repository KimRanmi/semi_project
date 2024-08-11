package com.cm.admin_page.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/replyForm")
public class replyCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public replyCreateServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // inquiry_no 파라미터 받기
        String inquiryNoStr = request.getParameter("inquiryNo");
        if (inquiryNoStr != null && !inquiryNoStr.isEmpty()) {
            try {
                int inquiryNo = Integer.parseInt(inquiryNoStr);
                // inquiry_no를 request에 담아서 JSP로 전달
                request.setAttribute("inquiryNo", inquiryNo);
            } catch (NumberFormatException e) {
                // inquiryNo가 유효한 숫자 형식이 아닌 경우 처리
                // 예외 처리 로직 추가
            }
        }

        // JSP로 forward
        RequestDispatcher view = request.getRequestDispatcher("/views/admin_page/reply_form.jsp");
        view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
