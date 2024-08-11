package com.cm.user_page.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.user.service.UserService;
import com.cm.user.vo.User;


@WebServlet("/user/profileSetting")
public class ProfileSettingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProfileSettingServlet() {
        super();
        
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		User u = (User)session.getAttribute("user");
		int no = u.getUser_no();
		User user = new UserService().getUserProfile(no);
		request.setAttribute("pro",user);
		RequestDispatcher view = request.getRequestDispatcher("/views/user_page/profileSetting.jsp");
		view.forward(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
