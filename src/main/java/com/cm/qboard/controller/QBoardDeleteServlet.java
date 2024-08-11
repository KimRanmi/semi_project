package com.cm.qboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cm.qboard.service.QBoardService;
import com.cm.qboard.vo.QBoard;
import com.cm.user.vo.User;

@WebServlet("/qboard/delete")
public class QBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QBoardDeleteServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int postNo = Integer.parseInt(request.getParameter("post_no"));
        HttpSession session = request.getSession(false);

        if (session != null) {
            User currentUser = (User) session.getAttribute("user");

            if (currentUser != null) {
                QBoardService service = new QBoardService();
                QBoard qboard = service.getQBoard(postNo);

                if (qboard != null && qboard.getUserNo() == currentUser.getUser_no()) {  // 현재 사용자의 userNo와 게시글의 userNo를 비교
                    boolean isDeleted = service.deleteBoard(postNo);

                    if (isDeleted) {
                        response.sendRedirect(request.getContextPath() + "/qboard/list");
                    } else {
                        request.setAttribute("qboard", qboard);  // qboard 객체 설정
                        request.setAttribute("errorMessage", "게시글 삭제에 실패했습니다.");
                        request.getRequestDispatcher("/views/qboard/qboard_detail.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("qboard", qboard);  // qboard 객체 설정
                    request.setAttribute("errorMessage", "삭제 권한이 없습니다.");
                    request.getRequestDispatcher("/views/qboard/qboard_detail.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/views/user/login.jsp");
            }
        } else {
            response.sendRedirect(request.getContextPath() + "/views/user/login.jsp");
        }
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
