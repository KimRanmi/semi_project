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

@WebServlet("/flashmob/delete")
public class FlashmobDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FlashmobDeleteServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int post_no = Integer.parseInt(request.getParameter("post_no"));
		int result = new FlashmobService().delete(post_no);
		
		response.sendRedirect(request.getContextPath() +"/flashmob/list");
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
