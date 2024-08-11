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
import com.cm.admin_page.vo.Reply;

@WebServlet("/admin/ReplyFormEnd")
public class replyCreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public replyCreateEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String inquiry_no = request.getParameter("inquiry_no");
	    int inquiryNoInt = Integer.parseInt(inquiry_no);
		String reply_text = request.getParameter("reply_text");
		
		Reply r = new Reply();
		r.setInquiry_no(inquiryNoInt);
		r.setReply_text(reply_text);
		
		int result = new ReplyService().createReply(r);
		
		if(result > 0) {
			response.sendRedirect("/inquiryBoard/list");
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
