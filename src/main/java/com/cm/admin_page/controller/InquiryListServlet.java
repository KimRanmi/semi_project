package com.cm.admin_page.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.admin_page.service.InquiryService;
import com.cm.admin_page.service.ReplyService;
import com.cm.admin_page.vo.Inquiry;
import com.cm.admin_page.vo.Reply;

@WebServlet("/inquiryBoard/list")
public class InquiryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InquiryListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("inquiry_title");
		
		Inquiry option = new Inquiry();
		option.setInquiry_title(title);
		
		String nowPage = request.getParameter("nowPage");
		if(nowPage != null) {
			option.setNowPage(Integer.parseInt(nowPage));
		}
		
		option.setTotalData(new InquiryService().selectInquiryCount(option));
		
		List<Inquiry> list = new InquiryService().selectInquiryList(option);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/admin_page/inquiry_list.jsp");
		request.setAttribute("paging", option);
		request.setAttribute("resultList", list);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
