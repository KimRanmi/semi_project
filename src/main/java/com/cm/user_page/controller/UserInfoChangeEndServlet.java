package com.cm.user_page.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.user.service.UserService;
import com.cm.user.vo.User;

// 회원정보 수정
@WebServlet(name="userInfoChangeEnd",urlPatterns="/user/userInfoChangeEnd")
public class UserInfoChangeEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UserInfoChangeEndServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		if(user == null) {
			response.sendRedirect("/user/login");
			return;
		}
		
		
		String email = request.getParameter("email");
		UserService us = new UserService();
		boolean isUpdated = us.updateUserEmail(user.getUser_id(), email);

        if (isUpdated) {
            user.setUser_email(email);
            session.setAttribute("user", user);
            session.setAttribute("message", "회원정보가 성공적으로 수정되었습니다.");
		
        } else {
            session.setAttribute("error", "회원정보 수정에 실패했습니다.");
			
        }
        response.sendRedirect(request.getContextPath() + "/user/userInfoChange");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
