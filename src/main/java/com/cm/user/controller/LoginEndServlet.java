package com.cm.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.user.dao.UserDao;
import com.cm.user.service.UserService;
import com.cm.user.vo.User;



@WebServlet(name="userLoginEnd",urlPatterns="/user/loginEnd")
public class LoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public LoginEndServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		
		
		UserService us = new UserService();
		User u = us.getUserInfo(id,pw);
		
		if(u != null) {
			HttpSession session = request.getSession(true);

            if (session.isNew() || session.getAttribute("user") == null) {
            	session.setAttribute("user", u);
                session.setMaxInactiveInterval(60 * 30);
                
                // 관리자, 일반사용자 구분하여 로그인
                if ("admin".equals(id) && "admin1234".equals(pw)) {
                	response.sendRedirect(request.getContextPath() + "/index.jsp");
                } else {
                	response.sendRedirect(request.getContextPath() + "/index.jsp");
                }
            } else {
                RequestDispatcher view = request.getRequestDispatcher("/views/user/login_fail.jsp");
                view.forward(request, response);
            }
        } else {
            RequestDispatcher view = request.getRequestDispatcher("/views/user/login_fail.jsp");
            view.forward(request, response);
			} 
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
