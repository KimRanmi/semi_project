package com.cm.flashmob.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.cm.flashmob.service.FlashmobService;
import com.cm.flashmob.vo.Flashmob;
import com.cm.user.vo.User;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/flashmob/editEnd")
public class FlashmobEditEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FlashmobEditEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(false);
		if(session!=null) {
			User user = (User)session.getAttribute("user");
			if(user!=null) {
				int userNo = user.getUser_no();
		int boardtype = 3;
		int local_gu=1;
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
		if(ServletFileUpload.isMultipartContent(request)) {
			String dir = request.getServletContext().getRealPath("/upload");
			int maxSize = 1024*1024*10; // 10mb
			String encoding ="UTF-8";
			DefaultFileRenamePolicy dfr = new DefaultFileRenamePolicy();
			MultipartRequest mr = new MultipartRequest(request,dir,maxSize,encoding,dfr);
			
			String oriName = mr.getOriginalFileName("thumbnail");
			String reName = mr.getFilesystemName("thumbnail");
			int postNo = Integer.parseInt(mr.getParameter("postNo"));
			String title = mr.getParameter("flashmob_post_title");
			LocalDateTime time = LocalDateTime.parse(mr.getParameter("flashmob_time"),formatter);
			String text = mr.getParameter("flashmob_post_text");
			String location = mr.getParameter("flashmob_location");
			int number = Integer.parseInt(mr.getParameter("flashmob_number"));
			String privacy = mr.getParameter("privacy");
			if (privacy == null) {
			    privacy = "Y";
			}else {
				privacy="N";
			}
			
			Flashmob f = new Flashmob();
			f.setFlashmob_location(location);
			f.setFlashmob_date(time);
			f.setFlashmob_number(number);
			f.setPost_title(title);
			f.setPost_text(text);
			f.setPost_release_yn(privacy);
			f.setUser_no(userNo);
			f.setBoard_type_id(boardtype);
			f.setLocal_gu_no(local_gu);
			
			int result = new FlashmobService().editFlashmob(postNo,userNo,boardtype,local_gu,f);
			response.sendRedirect(request.getContextPath() +"/flashmob/list");
		}}}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
