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

import com.cm.qboard.service.QBoardService;
import com.cm.user.vo.User;

@WebServlet("/qboard/create")
public class QBoardCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QBoardCreateServlet() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        User user = null;
        if (session != null) {
            user = (User) session.getAttribute("user");
            if (user != null) {
                System.out.println("Servlet: User No: " + user.getUser_no());
            } else {
                System.out.println("Servlet: User not found in session.");
            }
        } else {
            System.out.println("Servlet: Session not found.");
        }

        request.setAttribute("user", user); // 유저 정보를 request에 설정
        RequestDispatcher view = request.getRequestDispatcher("/views/qboard/create.jsp");
        view.forward(request, response);
    }
  
    


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
