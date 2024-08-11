package com.cm.user.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.user.service.UserService;
import com.cm.user.vo.User;


@WebServlet(name="findPwEnd", urlPatterns="/user/findPwEnd")
public class FindPwEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public FindPwEndServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("user_id");
        String nick = request.getParameter("user_nick");
        String question = request.getParameter("user_question");
        String answer = request.getParameter("user_answer");

        System.out.println("question: "+question);
        System.out.println("answer: "+answer);
        
        UserService us = new UserService();
        User user = us.findUserPw(id, nick, question, answer);

        if (user != null) {
        	String obscuredPassword = userPassword(user.getUser_pw());
            request.setAttribute("userPw", obscuredPassword);
            RequestDispatcher view = request.getRequestDispatcher("/views/user/find_pw_success.jsp");
            view.forward(request, response);
        } else {
            request.setAttribute("error_message", "비밀번호 찾기에 실패하였습니다.");
            RequestDispatcher view = request.getRequestDispatcher("/views/user/find_pw_fail.jsp");
            view.forward(request, response);
        }

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	// 비밀번호 끝4자리 *로 보이게
	private String userPassword(String password) {
		if (password.length() <= 4) {
			return "****";
		} else {
			String visiblePart = password.substring(0, password.length() - 4);
			return visiblePart + "****";
		}
	}

}
