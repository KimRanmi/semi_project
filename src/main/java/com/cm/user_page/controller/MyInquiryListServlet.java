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

import com.cm.admin_page.service.ReplyService;
import com.cm.admin_page.vo.Inquiry;
import com.cm.admin_page.vo.Reply;
import com.cm.user.vo.User;
import com.cm.user_page.service.MyInquiryService;

@WebServlet("/myInquiryboard/list")
public class MyInquiryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MyInquiryListServlet() {
       super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 세션에서 사용자 정보 가져오기
        HttpSession session = request.getSession(false); // false로 설정하여 새 세션 생성 안 함
        if (session != null) {
            // 세션에서 사용자 객체 가져오기
            User user = (User) session.getAttribute("user");
            if (user != null) {
                int userNo = user.getUser_no();
                String title = request.getParameter("inquiry_title");
                
                Inquiry option = new Inquiry();
                option.setUser_no(userNo);
                
                Reply option2 = new Reply();
                
                String nowPage = request.getParameter("nowPage");
                if(nowPage != null) {
                	option.setNowPage(Integer.parseInt(nowPage));
                }
                
                option.setTotalData(new MyInquiryService().selectInquiryCount(option));
                
                List<Inquiry> list = new MyInquiryService().selectInquiryList(option);
                List<Reply> list2 = new ReplyService().selectReplyList(option2);
                
                
                RequestDispatcher view = request.getRequestDispatcher("/views/user_page/myinquiry_list.jsp");
                request.setAttribute("paging", option);
                request.setAttribute("resultList", list);
                request.setAttribute("resultList2", list2);
                view.forward(request, response);
            }
        } 
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
