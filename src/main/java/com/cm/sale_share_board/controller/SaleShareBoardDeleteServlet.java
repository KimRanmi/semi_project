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


@WebServlet("/sale_share_board/sale_share_board_delete")
public class SaleShareBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SaleShareBoardDeleteServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String post = request.getParameter("id");
		int postNo = Integer.parseInt(post);
		
		System.out.println(postNo);
		
		int result = new SaleShareBoardService().saleDelete(postNo);
		int i = 0;
		RequestDispatcher view = null;
		if(result > 0) {
			response.sendRedirect(request.getContextPath() +"/sale_share_board/sale_share_board_list");
		}else {
			response.sendRedirect(request.getContextPath() +"/sale_share_board/sale_share_board_list");
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
