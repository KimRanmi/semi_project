package com.cm.qboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.cm.qboard.service.QBoardService;
import com.cm.qboard.vo.QBoard;
import com.cm.user.vo.User;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/qboard/updateEnd")
public class QBoardUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public QBoardUpdateEndServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (ServletFileUpload.isMultipartContent(request)) {
            String dir = request.getServletContext().getRealPath("/upload");
            int maxSize = 1024 * 1024 * 10;
            String encoding = "UTF-8";
            DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
            MultipartRequest mr = new MultipartRequest(request, dir, maxSize, encoding, dfr);

            String oriName = mr.getOriginalFileName("imageName");
            String newName = mr.getFilesystemName("imageName");
            String postNoParam = mr.getParameter("post_no");

            System.out.println("post_no parameter: " + postNoParam);
            int postNo = Integer.parseInt(mr.getParameter("post_no"));
            System.out.println("postno" + postNo);
            String title = mr.getParameter("post_title");
            String text = mr.getParameter("post_text");
            String postReleaseYn = mr.getParameter("post_release_yn");

            System.out.println(postNo);
            System.out.println("제목: " + title);
            System.out.println("내용: " + text);
            System.out.println("공개: " + postReleaseYn);

            QBoard originalQBoard = new QBoardService().getQBoard(postNo);

            if (originalQBoard != null) {
                HttpSession session = request.getSession(false);
                if (session != null) {
                    User currentUser = (User) session.getAttribute("user");
                    if (currentUser != null && currentUser.getUser_no() == originalQBoard.getUserNo()) {
                        QBoard qb = new QBoard();
                        qb.setPostNo(postNo);
                        qb.setPostTitle(title);
                        qb.setPostText(text);
                        qb.setPostReleaseYn(postReleaseYn);
                        qb.setImageOriName(oriName);
                        qb.setImageNewName(newName);

                        int result = new QBoardService().updateBoard(qb);
                        System.out.println("Update result: " + result);

                        RequestDispatcher view = request.getRequestDispatcher("/views/qboard/update_fail.jsp");
                        if (result > 0) {
                            view = request.getRequestDispatcher("/views/qboard/update_success.jsp");
                        }
                        view.forward(request, response);
                    } else {
                        request.setAttribute("errorMessage", "게시글 수정 권한이 없습니다.");
                        request.getRequestDispatcher("/views/qboard/update_fail.jsp").forward(request, response);
                    }
                } else {
                    System.out.println("Servlet: Session not found.");
                    response.sendRedirect("/views/user/login.jsp");
                }
            } else {
                request.setAttribute("errorMessage", "존재하지 않는 게시글입니다.");
                request.getRequestDispatcher("/views/qboard/update_fail.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("/qboard/update.jsp");
        }
    }



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
