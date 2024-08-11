package com.cm.admin_page.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.admin_page.service.InquiryService;
import com.cm.admin_page.vo.Inquiry;
import com.cm.user.vo.User;
import com.cm.user_page.service.MsgService;
import com.cm.user_page.vo.Message;

@WebServlet("/admin/inquiryFormEnd")
public class InquiryCreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InquiryCreateEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false); // false로 설정하여 새 세션 생성 안 함
        if (session != null) {
            // 세션에서 사용자 객체 가져오기
            User user = (User) session.getAttribute("user");
            if (user != null) {
                int userNo = user.getUser_no();
		
                String title = request.getParameter("inquiry_title");
                String text = request.getParameter("inquiry_text");
                
                Inquiry i = new Inquiry();
                i.setUser_no(userNo);
                i.setInquiry_title(title);
                i.setInquiry_text(text);
                
                int result = new InquiryService().createInquiry(i);
                
                if(result > 0) {
                	RequestDispatcher view = request.getRequestDispatcher("/views/admin_page/customer_center.jsp");
                	view.forward(request, response);
                }
				
            }
        }

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
