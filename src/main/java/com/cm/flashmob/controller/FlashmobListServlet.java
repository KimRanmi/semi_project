package com.cm.flashmob.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.flashmob.service.FlashmobService;
import com.cm.flashmob.vo.Flashmob;

@WebServlet("/flashmob/list")
public class FlashmobListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FlashmobListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sort = request.getParameter("sort");
		if (sort == null) {
            sort = "latest";
        }
		 
		String title = request.getParameter("post_title");
		Flashmob option = new Flashmob();
		option.setPost_title(title);
		
		String nowPage = request.getParameter("nowPage");
		if(nowPage!=null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		
		option.setTotalData(new FlashmobService().selectFlashmobCount(option));
		List<Flashmob> list = new FlashmobService().selectFlashmobList(sort,option);
		request.setAttribute("paging", option);
		request.setAttribute("resultList", list);
		RequestDispatcher view = request.getRequestDispatcher("/views/flashmob_board/list.jsp");
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
