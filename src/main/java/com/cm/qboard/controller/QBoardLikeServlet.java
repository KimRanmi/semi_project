package com.cm.qboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.qboard.service.QboardLikeService;
import com.cm.qboard.vo.QBoardLike;
import com.cm.user.vo.User;

@WebServlet("/QBoard/like")
public class QBoardLikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QBoardLikeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session!=null) {
			User user = (User)session.getAttribute("user");
			if(user!=null) {
				int user_no=user.getUser_no();
		int post_no=Integer.parseInt(request.getParameter("post_no"));
		QBoardLike bl = new QBoardLike();
		bl.setPost_no(post_no);
		bl.setUser_no(user_no);
		int result = new QboardLikeService().like(bl);
	      
	      RequestDispatcher view = request.getRequestDispatcher("/views/qboard/like.jsp");
	      view.forward(request, response);
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
