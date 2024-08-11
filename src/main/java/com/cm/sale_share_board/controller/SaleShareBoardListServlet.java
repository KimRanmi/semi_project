package com.cm.sale_share_board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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


@WebServlet("/sale_share_board/sale_share_board_list")
public class SaleShareBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaleShareBoardListServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SaleShareList option = new SaleShareList();
		
		String nowPage = request.getParameter("nowPage");
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		
		option.setTotalData(new SaleShareBoardService().selectListCount(option));
		List<SaleShareList> list = new ArrayList<SaleShareList>();
		list = new SaleShareBoardService().selectSaleBoardList(option);
		
		request.setAttribute("paging", option);
		request.setAttribute("resultList", list);

		RequestDispatcher view = request.getRequestDispatcher("/views/sale_share_board/sale_share_board_list.jsp");
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

