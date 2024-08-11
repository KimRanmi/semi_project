package com.cm.qboard.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cm.qboard.service.QBoardCommentService;
import com.cm.qboard.vo.QBoardComment;

@WebServlet("/qboard/comment/list")
public class QBoardCommentListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public QBoardCommentListServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postNo = Integer.parseInt(request.getParameter("post_no"));

        List<QBoardComment> commentList = new QBoardCommentService().selectCommentsList(postNo);
        request.setAttribute("commentList", commentList);

        RequestDispatcher view = request.getRequestDispatcher("/views/qboard/qboard_detail.jsp");
        view.forward(request, response);
    }
}
