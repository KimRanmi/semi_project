package com.cm.flashmob.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.flashmob.service.FlashmobApplyService;
import com.cm.flashmob.vo.FlashmobApply;

@WebServlet("/flashmob/applyCheck")
public class FlashmobApplyCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public FlashmobApplyCheckServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNo=Integer.parseInt(request.getParameter("post_no"));
		List<FlashmobApply> list = new FlashmobApplyService().checklist(postNo);
		request.setAttribute("resultList", list);
		RequestDispatcher view = request.getRequestDispatcher("/views/flashmob_board/check_post.jsp");
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
