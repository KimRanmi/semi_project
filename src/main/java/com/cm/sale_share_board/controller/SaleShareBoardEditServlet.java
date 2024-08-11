package com.cm.sale_share_board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.sale_share_board.service.SaleShareBoardService;
import com.cm.sale_share_board.vo.SaleShareList;

// 수정하기 확인
@WebServlet("/sale_share_board/sale_share_board_edit")
public class SaleShareBoardEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaleShareBoardEditServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String post = request.getParameter("id");
		int postNo = Integer.parseInt(post);
		int i = 0;
		SaleShareList ssl = new SaleShareBoardService().selectBoard(postNo);
		
		
		request.setAttribute(post, ssl);
		request.setAttribute("postNo", postNo);
		request.setAttribute("list", ssl);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/sale_share_board/sale_share_board_edit.jsp");
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
