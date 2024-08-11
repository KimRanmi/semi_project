package com.cm.sale_share_board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.sale_share_board.service.SaleShareBoardService;
import com.cm.sale_share_board.vo.SaleShareList;
import com.cm.user.vo.User;


// 상세글 조회하기
@WebServlet("/sale_share_board/sale_share_board_detail")
public class ViewPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ViewPostServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = 0;
		
		HttpSession session = request.getSession(false);
		if (session != null) {
	        User u = (User) session.getAttribute("user");
	        if (u != null) {
	            userNo = u.getUser_no();
	        }
	    }
		
		String post = request.getParameter("id");
		int postNo = Integer.parseInt(post);
		SaleShareList ssl = new SaleShareBoardService().selectBoard(postNo);
		boolean result = new SaleShareBoardService().selectLike(ssl,userNo);
		
		request.setAttribute("list", ssl);
		request.setAttribute("boolean", result);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/sale_share_board/sale_share_board_detail.jsp");
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}

