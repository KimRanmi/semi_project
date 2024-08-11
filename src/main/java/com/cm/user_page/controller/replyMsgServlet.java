package com.cm.user_page.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.user_page.service.MsgService;

@WebServlet("/user/replyMsgForm")
public class replyMsgServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public replyMsgServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String senderNoStr = request.getParameter("senderNo");
		
		int senderNo = Integer.parseInt(senderNoStr);
		
		String senderNick = new MsgService().selectMsg(senderNo);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/user_page/reply_msg.jsp");
		request.setAttribute("senderNick", senderNick);
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
