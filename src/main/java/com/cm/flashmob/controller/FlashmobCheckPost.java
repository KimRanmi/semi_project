package com.cm.flashmob.controller;

import java.io.IOException;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.flashmob.service.FlashmobApplyService;
import com.cm.flashmob.service.FlashmobLikeService;
import com.cm.flashmob.service.FlashmobService;
import com.cm.flashmob.vo.Flashmob;
import com.cm.flashmob.vo.FlashmobApply;
import com.cm.flashmob.vo.FlashmobLike;
import com.cm.user.vo.User;


@WebServlet("/flashmob/check")
public class FlashmobCheckPost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public FlashmobCheckPost() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int post_no = Integer.parseInt(request.getParameter("post_no"));
		System.out.println("게시글번호:"+post_no);
		String name = new FlashmobService().getName(post_no);
		Flashmob check = new FlashmobService().checkPost(post_no);
		int cnt = new FlashmobApplyService().count(post_no);
		List<FlashmobApply> displayList = new FlashmobApplyService().showList(post_no);
		List<FlashmobApply> list = new FlashmobApplyService().checklist(post_no);

		request.setAttribute("displayList", displayList);
		request.setAttribute("resultList", list);
		request.setAttribute("post", check);
		request.setAttribute("count", cnt);
		request.setAttribute("name", name);
		RequestDispatcher view = request.getRequestDispatcher("/views/flashmob_board/check_post.jsp");
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session!=null) {
			User user = (User)session.getAttribute("user");
			if(user!=null) {
				int user_no=user.getUser_no();
		int post_no=Integer.parseInt(request.getParameter("post_no"));
		FlashmobLike fl = new FlashmobLike();
		fl.setPost_no(post_no);
		fl.setLike_user_no(user_no);
		int result = new FlashmobLikeService().like(fl);
		
		doGet(request, response);
	}}}

}
