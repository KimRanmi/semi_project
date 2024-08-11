package com.cm.qboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.qboard.service.QBoardService;
import com.cm.qboard.vo.QBoard;
import com.cm.user.vo.User;



@WebServlet("/qboard/update")
public class QBoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QBoardUpdateServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postNo = Integer.parseInt(request.getParameter("post_no"));
        HttpSession session = request.getSession(false);
        User user = null;
        if (session != null) {
            user = (User) session.getAttribute("user");
            if (user != null) {
                System.out.println("Servlet: User No: " + user.getUser_no());
            } else {
                System.out.println("Servlet: User not found in session.");
                response.sendRedirect(request.getContextPath() + "/views/user/login.jsp");
                return;
            }
        } else {
            System.out.println("Servlet: Session not found.");
            response.sendRedirect(request.getContextPath() + "/views/user/login.jsp");
            return;
        }

        QBoard result = new QBoardService().getQBoard(postNo);
        if (result != null && result.getUserNo() == user.getUser_no()) {
            request.setAttribute("qboard", result);
            request.setAttribute("user", user);
            RequestDispatcher view = request.getRequestDispatcher("/views/qboard/update.jsp");
            view.forward(request, response);
        } else {
            request.setAttribute("errorMessage", "수정 권한이 없습니다.");
            request.getRequestDispatcher("/views/qboard/qboard_detail.jsp").forward(request, response);
        }
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
