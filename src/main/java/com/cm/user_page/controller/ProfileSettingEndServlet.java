package com.cm.user_page.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.user.service.UserService;
import com.cm.user.vo.User;


@WebServlet("/user/profileSettingEnd")
public class ProfileSettingEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProfileSettingEndServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User u = (User)session.getAttribute("user");
		
		int userNo=u.getUser_no();
		
		String currentNick = u.getUser_nick(); // 현재 닉네임
		
		
		String nick = request.getParameter("nickname");
		String text = request.getParameter("bio");
		
		UserService us = new UserService();
		
		// 기존 닉네임과 변경된 닉네임 비교
        if (!currentNick.equals(nick)) {
            // 닉네임 중복 확인
            boolean isAvailable = us.checkNicknameAvailability(nick);
            if (!isAvailable) {
                request.setAttribute("errorMessage", "중복된 닉네임입니다.");
                request.getRequestDispatcher("/views/user_page/profileSetting.jsp").forward(request, response);
                return;
            }
        }
		
        boolean result = us.updateUserProfile(userNo, nick, text);
		String id = u.getUser_id();

		if (result) {
            // 세션 업데이트
            u.setUser_nick(nick);
            u.setProfile_text(text);
            session.setAttribute("user", u);
			response.sendRedirect(request.getContextPath() + "/user/userMyPage");
		}else{
			response.sendRedirect(request.getContextPath() + "/user/userMyPage");
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
