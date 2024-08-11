package com.cm.user_page.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.user.vo.User;
import com.cm.user_page.service.MsgService;
import com.cm.user_page.vo.Message;

@WebServlet("/user/msgFormEnd")
public class MsgWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MsgWriteEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션에서 사용자 정보 가져오기
        HttpSession session = request.getSession(false); // false로 설정하여 새 세션 생성 안 함
        if (session != null) {
            // 세션에서 사용자 객체 가져오기
            User user = (User) session.getAttribute("user");
            if (user != null) {
                int userNo = user.getUser_no();
		
				String receiver_nick = request.getParameter("receiver_nick");
				String msg_title = request.getParameter("msg_title");
				String msg_text = request.getParameter("msg_text");
				
				Message m = new Message();
				m.setSender_no(userNo);
				m.setUser_nick(receiver_nick);
				m.setMsg_title(msg_title);
				m.setMsg_text(msg_text);
				System.out.println(msg_text);
				
				int result = new MsgService().writeMsg(m);
				
				if(result > 0) {
					response.sendRedirect("/receivedMsg/list");
				} 
            }
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
