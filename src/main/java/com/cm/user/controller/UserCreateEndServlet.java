package com.cm.user.controller;

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


@WebServlet(name="userCreateEnd",urlPatterns="/user/createEnd")
public class UserCreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public UserCreateEndServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		request.setCharacterEncoding("UTF-8");
		
		response.setContentType("text/html;charset=UTF-8");
		
		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");
		String email = request.getParameter("user_email");
		String question = request.getParameter("user_question");
		String answer = request.getParameter("user_answer");
		String address = request.getParameter("user_address");
		String nick = request.getParameter("user_nick");
		
		// 아이디, 비밀번호 찾기 질문 입력 안할 시 오류메시지 출력
		if (question == null || question.isEmpty()) {
		    request.setAttribute("error_message", "Question is required.");
		    
		   
		    
		    RequestDispatcher view = request.getRequestDispatcher("/views/user/create_fail.jsp");
		    view.forward(request, response);
		    return;
		}
		if (answer == null || answer.isEmpty()) {
		    request.setAttribute("error_message", "Question answer is required.");
		    
		    
		    
		    RequestDispatcher view = request.getRequestDispatcher("/views/user/create_fail.jsp");
		    view.forward(request, response);
		    return;
		}
		
		
		

        int user_question = Integer.parseInt(question);
		// 여기까지
        
        
        User u = new User();
        u.setUser_id(id);
        u.setUser_pw(pw);
        u.setUser_email(email);
        u.setUser_address(address);
        u.setUser_nick(nick);
        u.setUser_answer(answer);
        u.setUser_question(user_question);
        
        // 디버깅용 출력
        System.out.println("User ID: " + id);
        System.out.println("User PW: " + pw);
        System.out.println("User Email: " + email);
        System.out.println("User Address: " + address);
        System.out.println("User Nick: " + nick);
        System.out.println("answer: " + answer);
        System.out.println("question: " + question);
        
        int result = new UserService().createUser(u);
        
        
		
		RequestDispatcher view = request.getRequestDispatcher("/views/user/create_fail.jsp");
		if(result > 0) {
			
			view = request.getRequestDispatcher("/views/user/create_success.jsp");
			
		} else {
			if (request.getAttribute("error_message") == null) {
				request.setAttribute("error_message", "Failed to create user.");
				System.out.println("Failed to create user.");
			}
        }
		
		view.forward(request, response);
      
        
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
