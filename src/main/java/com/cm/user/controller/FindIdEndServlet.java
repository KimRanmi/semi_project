package com.cm.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.user.service.UserService;


@WebServlet(name="findIdEnd", urlPatterns="/user/findIdEnd")
public class FindIdEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public FindIdEndServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nick = request.getParameter("user_nick");
		String email = request.getParameter("user_email");

        UserService us = new UserService();
        String userId = us.findUserIdByNickAndEmail(nick, email);

        if (userId != null) {
            request.setAttribute("userId", userId);
            RequestDispatcher view = request.getRequestDispatcher("/views/user/find_id_success.jsp");
            view.forward(request, response);
        } else {
            request.setAttribute("error_message", "아이디 찾기에 실패하였습니다.");
            RequestDispatcher view = request.getRequestDispatcher("/views/user/find_id_fail.jsp");
            view.forward(request, response);
        }
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	doGet(request, response);
	}
}
