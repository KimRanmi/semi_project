package com.cm.user_page.controller;

import java.io.IOException;
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

@WebServlet("/user/MyboardSaleShare")
public class MyBoardSaleShareServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyBoardSaleShareServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		 SaleShareList option = new SaleShareList();
		 String nowPage = request.getParameter("nowPage");
		 int userNo = 0;
		 
		 if(nowPage != null) {
				option.setNowPage(Integer.parseInt(nowPage));
			}
			
			option.setTotalData(new SaleShareBoardService().selectListCount(option));
		 
		 if(session != null) {
			 User u = (User)session.getAttribute("user");
			 userNo = u.getUser_no();
		 }
		 
		 System.out.println(userNo);
		
		 List<SaleShareList> list = new SaleShareBoardService().myPageList(userNo);
		 request.setAttribute("paging", option);
		 request.setAttribute("list", list);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/user_page/myboard_saleShare.jsp");
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
