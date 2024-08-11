package com.cm.flashmob.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.flashmob.service.FlashmobService;
import com.cm.flashmob.vo.Flashmob;


@WebServlet("/flashmob/edit")
public class FlashmobEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public FlashmobEditServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int postNo=Integer.parseInt(request.getParameter("post_no"));
		Flashmob check = new FlashmobService().checkPost(postNo);
		request.setAttribute("post", check);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/flashmob_board/edit.jsp");
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
