package com.cm.qboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.qboard.service.QBoardService;
import com.cm.qboard.vo.QBoard;
import com.cm.common.Paging;
import com.cm.user.vo.User;


@WebServlet("/qboard/list")
public class QBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public QBoardListServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int nowPage = 1;
        if (request.getParameter("nowPage") != null) {
            nowPage = Integer.parseInt(request.getParameter("nowPage"));
        }

        String sort = request.getParameter("sort");
        if (sort == null) {
            sort = "latest";
        }

        QBoardService service = new QBoardService();
        QBoard qb = new QBoard();
        User user = new User();

        String searchType = request.getParameter("search_type");
        String searchQuery = request.getParameter("search_query");

        if (searchType != null && searchQuery != null && !searchQuery.isEmpty()) {
            if ("title".equals(searchType)) {
                qb.setPostTitle(searchQuery);
            } else if ("author".equals(searchType)) {
                user.setUser_nick(searchQuery);
                qb.setUser(user);
            } else if ("title_author".equals(searchType)) {
                qb.setPostTitle(searchQuery);
                user.setUser_nick(searchQuery);
                qb.setUser(user);
            }
        }

        int totalRecords = service.selectBoardCount(qb);
        Paging paging = new Paging();
        paging.setTotalData(totalRecords);
        paging.setNowPage(nowPage);

        List<QBoard> list = service.getQBoardList(sort, nowPage, paging.getNumPerPage(), qb);
        request.setAttribute("qbList", list);
        request.setAttribute("paging", paging);
        request.setAttribute("sort", sort);

        RequestDispatcher view = request.getRequestDispatcher("/views/qboard/list.jsp");
        view.forward(request, response);
    }
	


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
