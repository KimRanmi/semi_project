package com.cm.flashmob.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.flashmob.service.FlashmobApplyService;
import com.cm.flashmob.vo.FlashmobApply;
import com.cm.user.vo.User;

@WebServlet("/flashmob/apply")
public class FlashmobApplyEnd extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FlashmobApplyEnd() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		if(session !=null) {User user = (User)session.getAttribute("user");
		if(user!=null) {
			int userNo = user.getUser_no();
			String introduce = request.getParameter("introduce");
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		FlashmobApply fa = new FlashmobApply();
		fa.setPost_no(postNo);
		fa.setApplication_text(introduce);
		fa.setUser_no(userNo);
		int result = new FlashmobApplyService().createApply(fa);
		
		response.sendRedirect(request.getContextPath() +"/flashmob/check?post_no="+postNo);}}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
