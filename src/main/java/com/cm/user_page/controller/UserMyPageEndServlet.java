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


@WebServlet(name="userMyPageEnd",urlPatterns="/user/userMyPageEnd")
public class UserMyPageEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
    public UserMyPageEndServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("user");
        
        
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/user/login");
            return;
        }

        UserService userService = new UserService();
        User userInfo = userService.getUserProfile(user.getUser_no());
        session.setAttribute("userProfile", userInfo);
        request.getRequestDispatcher("/views/user_page/userMyPage.jsp").forward(request, response);
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
