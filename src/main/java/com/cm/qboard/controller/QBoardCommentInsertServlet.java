package com.cm.qboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.qboard.service.QBoardCommentService;
import com.cm.qboard.vo.QBoardComment;
import com.cm.user.vo.User;

@WebServlet("/qboard/comment/insert")
public class QBoardCommentInsertServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public QBoardCommentInsertServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            User u = (User) session.getAttribute("user");
            if (u != null) {
                String postNoStr = request.getParameter("post_no");
                String commentText = request.getParameter("comment_text");

                if (postNoStr != null && !postNoStr.trim().isEmpty() && commentText != null && !commentText.trim().isEmpty()) {
                    int postNo = Integer.parseInt(postNoStr);
                    int userNo = u.getUser_no();  // 세션에서 사용자 번호를 가져옴

                    QBoardComment comment = new QBoardComment();
                    comment.setPostNo(postNo);
                    comment.setUserNo(userNo);  // 세션에서 가져온 사용자 번호를 설정
                    comment.setCommentText(commentText);

                    int result = new QBoardCommentService().insertComment(comment);

                    if (result > 0) {
                        response.sendRedirect("/qboard/detail?post_no=" + postNo);
                    } else {
                        response.sendRedirect("/views/qboard/comment_fail.jsp");
                    }
                } else {
                    // 필요한 파라미터가 없거나 유효하지 않은 경우 처리
                    response.sendRedirect("/views/qboard/comment_fail.jsp");
                }
            } else {
                // 사용자 정보가 세션에 없는 경우 로그인 페이지로 리다이렉트
                response.sendRedirect("/views/user/login.jsp");
            }
        } else {
            // 세션이 없는 경우 로그인 페이지로 리다이렉트
            response.sendRedirect("/views/user/login.jsp");
        }
    }
}