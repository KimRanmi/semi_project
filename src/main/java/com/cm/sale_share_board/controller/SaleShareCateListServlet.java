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


@WebServlet("/sale_share_board/sale_share_board_cate")
public class SaleShareCateListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaleShareCateListServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String cate = request.getParameter("key");
		
		SaleShareList option = new SaleShareList();

		 int i = 0;
		String nowPage = request.getParameter("nowPage");
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		
		List<SaleShareList> list = new ArrayList<SaleShareList>();
		
		if(cate.equals("'share'")) {
        		option.setTotalData(new SaleShareBoardService().selectListShareCount(option));
        		list = new SaleShareBoardService().selectShare(option);
		}else if(cate.equals("'sell'")) {
        		option.setTotalData(new SaleShareBoardService().selectListSellCount(option));
        		list = new SaleShareBoardService().selectSale(option);
		}else {
			option.setTotalData(new SaleShareBoardService().selectListCount(option));
        		list = new SaleShareBoardService().selectSaleBoardList(option);

		}
		System.out.println(list);

		
		request.setAttribute("paging", option);
		request.setAttribute("resultList", list);
		
		
		RequestDispatcher view = request.getRequestDispatcher("/views/sale_share_board/sale_share_cate_list.jsp");
		view.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
