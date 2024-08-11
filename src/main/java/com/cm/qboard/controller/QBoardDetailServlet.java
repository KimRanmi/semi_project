package com.cm.qboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.qboard.service.QBoardCommentService;
import com.cm.qboard.service.QBoardService;
import com.cm.qboard.vo.QBoard;
import com.cm.qboard.vo.QBoardComment;
import com.cm.user.vo.User;


@WebServlet("/qboard/detail")
public class QBoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QBoardDetailServlet() {
        super();

    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postNo = Integer.parseInt(request.getParameter("post_no"));
       
        QBoard qboard = new QBoardService().getQBoard(postNo);

        if (qboard == null) {
            System.out.println("Servlet: QBoard object is null");
        } else {
            System.out.println("Servlet: QBoard object is not null");
        }

        List<QBoardComment> commentList = new QBoardCommentService().selectCommentsList(postNo);

        HttpSession session = request.getSession(false);
        if (session != null) {
            User u = (User) session.getAttribute("user");
            if (u != null) {
                int userNo = u.getUser_no();
                System.out.println("User No: " + userNo);
            } else {
                System.out.println("User not found in session.");
            }
        } else {
            System.out.println("Session not found.");
        }

        request.setAttribute("qboard", qboard);
        request.setAttribute("commentList", commentList);
        RequestDispatcher view = request.getRequestDispatcher("/views/qboard/qboard_detail.jsp");
        view.forward(request, response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
