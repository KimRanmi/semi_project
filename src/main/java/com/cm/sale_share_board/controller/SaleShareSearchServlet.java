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

import com.cm.sale_share_board.service.SaleShareBoardService;
import com.cm.sale_share_board.vo.SaleShareList;


@WebServlet("/sale_share/searchList")
public class SaleShareSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SaleShareSearchServlet() {
        super();
      
    }

	// 조회 (제목, 내용, 닉네임)
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SaleShareList option = new SaleShareList();
		String search = request.getParameter("search");
		String title = request.getParameter("search_text");
		String nowPage = request.getParameter("nowPage");
		option.setPost_title(title);
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		
		System.out.println(option.getPost_title());
		option.setTotalData(new SaleShareBoardService().selectListCount(option));
		List<SaleShareList> list = new ArrayList<SaleShareList>();
		
		
		switch(search) {
			case "1" : list = new SaleShareBoardService().selectSaleBoardList(option); break;
			case "2" : list = new SaleShareBoardService().selectSaleSearchText(option); break;
		}
		
		
		request.setAttribute("paging", option);
		request.setAttribute("resultList", list);

		
		RequestDispatcher view = request.getRequestDispatcher("/views/sale_share_board/sale_share_search_list.jsp");
		view.forward(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
