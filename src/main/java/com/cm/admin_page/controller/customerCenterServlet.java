package com.cm.admin_page.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.user.vo.User;

@WebServlet("/customerCenter")
public class customerCenterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public customerCenterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false); // false로 설정하여 새 세션 생성 안 함
        if (session != null) {
            // 세션에서 사용자 객체 가져오기
            User user = (User) session.getAttribute("user");
            if (user != null) {
            	RequestDispatcher view = request.getRequestDispatcher("/views/admin_page/customer_center.jsp");
            	view.forward(request, response);
            }
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
