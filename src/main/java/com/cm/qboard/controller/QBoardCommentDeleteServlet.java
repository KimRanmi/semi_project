package com.cm.qboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.qboard.service.QBoardCommentService;
import com.cm.qboard.service.QBoardService;
import com.cm.qboard.vo.QBoard;
import com.cm.qboard.vo.QBoardComment;
import com.cm.user.vo.User;

@WebServlet("/qboard/comment/delete")
public class QBoardCommentDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public QBoardCommentDeleteServlet() {
        super();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int commentNo = Integer.parseInt(request.getParameter("comment_no"));
        int postNo = Integer.parseInt(request.getParameter("post_no"));

        HttpSession session = request.getSession(false);
        if (session != null) {
            User currentUser = (User) session.getAttribute("user");
            if (currentUser != null) {
               
                QBoardComment comment = new QBoardCommentService().getCommentById(commentNo);

                if (comment != null && comment.getUser().getUser_no() == currentUser.getUser_no()) {
                    boolean isDeleted = new QBoardCommentService().deleteComment(commentNo);

                    if (isDeleted) {
                        response.sendRedirect(request.getContextPath() + "/qboard/detail?post_no=" + postNo);
                        return;
                    } else {
                        request.setAttribute("errorMessage", "댓글 삭제에 실패했습니다.");
                        RequestDispatcher view = request.getRequestDispatcher("/views/qboard/qboard_detail.jsp");
                        view.forward(request, response);
                        return;
                    }
                } else {
                    request.setAttribute("errorMessage", "삭제 권한이 없습니다.");
                    RequestDispatcher view = request.getRequestDispatcher("/views/qboard/qboard_detail.jsp");
                    view.forward(request, response);
                    return;
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/views/user/login.jsp");
                return;
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/views/user/login.jsp");
            return;
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}