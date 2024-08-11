package com.cm.flashmob.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.flashmob.service.FlashmobService;
import com.cm.flashmob.vo.Flashmob;
import com.cm.user.vo.User;

@WebServlet("/user/myMeetings")
public class FlashmobMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FlashmobMyPageServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("모임 마이페이지");
		HttpSession session = request.getSession(false);
		if(session!=null) {
			User user = (User)session.getAttribute("user");
			if(user!=null) {
			int userNo = user.getUser_no();
			List<Flashmob> mywritelist = new FlashmobService().mywriteFlashmob(userNo);
			List<Flashmob> mylikelist = new FlashmobService().mylikeFlashmob(userNo);
			List<Flashmob> myjoinlist = new FlashmobService().myjoinFlashmob(userNo);
			System.out.println(mywritelist);
			request.setAttribute("mywrite", mywritelist);
			request.setAttribute("mylike", mylikelist);
			request.setAttribute("myjoin",myjoinlist);
			RequestDispatcher view = request.getRequestDispatcher("/views/user_page/userMyPage.jsp");
			view.forward(request, response);
		}}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
