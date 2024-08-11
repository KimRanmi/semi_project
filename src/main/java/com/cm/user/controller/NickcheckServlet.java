package com.cm.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.user.service.UserService;
import com.cm.user.vo.User;


@WebServlet("/NickcheckServlet")
public class NickcheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public NickcheckServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nick = request.getParameter("user_nick");
		
		UserService us = new UserService();
		
		
		
		int result = us.checkNick(nick);

		response.getWriter().print(result);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	

}
