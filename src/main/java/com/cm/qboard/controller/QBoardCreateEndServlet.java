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

@WebServlet("/qboard/createEnd")
public class QBoardCreateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QBoardCreateEndServlet() {
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
            System.out.println("Original File Name: " + oriName);
            System.out.println("New File Name: " + newName);

            String title = mr.getParameter("postTitle");
            String text = mr.getParameter("postText");
            System.out.println("Title: " + title);
            System.out.println("Text: " + text);

            QBoard qb = new QBoard();
            qb.setPostTitle(title);
            qb.setPostText(text);

            HttpSession session = request.getSession(false);
            if (session != null) {
                User u = (User) session.getAttribute("user");
                if (u != null) {
                    int userNo = u.getUser_no();
                    qb.setUserNo(userNo);
                } else {
                    System.out.println("Servlet: User not found in session.");
                }
            } else {
                System.out.println("Servlet: Session not found.");
            }
            qb.setImageOriName(oriName);
            qb.setImageNewName(newName);
            int result = new QBoardService().createBoard(qb);
            System.out.println("서블릿 result=" + result);
            RequestDispatcher view = request.getRequestDispatcher("/views/qboard/create_fail.jsp");
            if (result > 0) {
                view = request.getRequestDispatcher("/views/qboard/create_success.jsp");
            }
            view.forward(request, response);
        } else {
            response.sendRedirect("/qboard/create");
        }
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
