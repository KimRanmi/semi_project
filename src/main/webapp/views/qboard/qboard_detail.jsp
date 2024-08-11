<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cm.qboard.vo.QBoard" %>
<%@ page import="com.cm.qboard.vo.QBoardComment , com.cm.user.vo.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Question Board Detail</title>
     <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="../resources/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="../resources/css/style.css">
  <link rel="stylesheet" type="text/css" href="../resources/css/normalize.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        body {
          
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        header {
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    position: relative;
}
        .container-test {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .post-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .post-meta {
            font-size: 14px;
            color: #777;
            margin-bottom: 20px;
        }
        .post-content {
            font-size: 16px;
            margin-bottom: 20px;
        }

        .comments-section {
            margin-top: 40px;
        }
        .comment {
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            margin-bottom: 10px;
        }
        .comment .comment-author {
            font-weight: bold;
        }
        .comment .comment-meta {
            font-size: 12px;
            color: #777;
            margin-bottom: 5px;
        }
        .comment .comment-text {
            font-size: 14px;
        }
        .comment-form {
            margin-top: 20px;
        }
        .comment-form textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            resize: none;
        }
        .comment-form button {
            margin-top: 10px;
            padding: 10px 20px;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 8px;
            cursor: pointer;
        }
        .comment-form button:hover {
            background-color: #0056b3;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .table th, .table td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .table th {
            background-color: #f2f2f2;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin-right: 5px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border-radius: 5px;
            text-align: center;
        }
        .btn-danger {
            background-color: #dc3545;
        }
        .btn-primary {
            background-color: #007bff;
        }
        
    </style>
</head>
<body>
<%@ include file="../include/new_header.jsp" %>

    <%@page import="com.cm.qboard.vo.QBoard, java.util.* ,com.cm.user.vo.User" %>
<section>
    <div class="container-test">
        <div class="post-title">게시판글 보기</div>
        <div class="post-meta">
            <%
            	User u = (User) session.getAttribute("user");
                QBoard qboard = (QBoard) request.getAttribute("qboard");
                if (qboard != null) {
            %>
            <span>게시물 번호: <%= qboard.getPostNo() %></span> | 
            <span>작성자: <%= qboard.getUser().getUser_nick() %></span>
           <a href="/user/msgForm?post_no=<%= qboard.getPostNo() %>" >쪽지</a>
        </div>
        <div class="post-content">
            <h2><%= qboard.getPostTitle() %></h2>
            <p><%= qboard.getPostText() %></p>
            <img src="<%= request.getContextPath() + "/upload/" + qboard.getImageNewName() %>" alt="Post Image">
        </div>
        <div class="post-meta">
            <span>작성일: <%= qboard.getPostRegDate() %></span> | 
            <span>게시 여부: <%= qboard.getPostReleaseYn() %></span>
        </div>
        <div class="post-actions">
            <a href="/QBoard/like?post_no=<%= qboard.getPostNo() %>" ><img src="../../resources/images/하트.png" alt="하트아이콘" width="40" height="30"></a>
            <a href="/qboard/list" class="btn btn-primary">뒤로가기</a>
            
            <% if (u != null && u.getUser_no() == qboard.getUserNo()) { %>
                <a href="<%= request.getContextPath() %>/qboard/update?post_no=<%= qboard.getPostNo() %>" class="btn btn-primary">수정</a>
                <form action="<%= request.getContextPath() %>/qboard/delete" method="post" style="display:inline;" onsubmit="return confirmDelete()">
                    <input type="hidden" name="post_no" value="<%= qboard.getPostNo() %>">
                    <button type="submit" class="btn btn-danger">삭제</button>
                </form>
            <% } %>
        </div>
        <% } else { %>
        <div class="alert alert-danger" role="alert">
            해당 게시글을 찾을 수 없습니다.
        </div>
        <% } %>
    </div>
</section>
<section class="comments-section">
    <div class="container-test">
        <h2>댓글</h2>
        <form action="/qboard/comment/insert" method="post" class="comment-form">
            <input type="hidden" name="post_no" value="<%= request.getParameter("post_no") %>">
            <input type="hidden" name="user_no" value="1"> <!-- 예시로 사용자 번호를 1로 설정 -->
            <textarea name="comment_text" rows="4" placeholder="댓글을 작성하세요"></textarea>
            <br>
            <button type="submit">댓글 작성</button>
            <br>
        </form>
        <br>
        <h3>댓글 목록</h3>
        <table class="table">
            <thead>
                <tr>
                    <th>작성자 번호</th>
                    <th>댓글 내용</th>
                    <th>작성일</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<QBoardComment> commentList = (List<QBoardComment>) request.getAttribute("commentList");
                    if (commentList != null && !commentList.isEmpty()) {
                        for (QBoardComment comment : commentList) {
                %>
                <tr>
                    <td><%= comment.getUser().getUser_nick() %></td>
                    <td><%= comment.getCommentText() %></td>
                    <td><%= comment.getCommentRegDate() %></td>
                    <td>
                        <form action="/qboard/comment/delete" method="post" style="display:inline;">
                            <input type="hidden" name="comment_no" value="<%= comment.getCommentNo() %>">
                            <input type="hidden" name="post_no" value="<%= request.getParameter("post_no") %>">
                        </form>
                         <% if (u != null && u.getUser_no() == qboard.getUserNo()) { %>
                            <button type="submit" class="btn btn-danger">삭제</button>
                          <% } %>  
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4">댓글이 없습니다.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</section>
<script>
    function confirmDelete() {
        return confirm("정말로 이 게시글을 삭제하시겠습니까?");
    }
</script>
  </footer>

  <div id="footer-bottom">
    <div class="container">
      <hr class="m-0">
      <div class="row mt-3">
        <div class="col-md-6 copyright">
          <p class="secondary-font">© 2024 cocomong. All rights reserved.</p>
        </div>
        <div class="col-md-6 text-md-end">
          <p class="secondary-font">Free HTML Template by <a href="https://templatesjungle.com/" target="_blank"
              class="text-decoration-underline fw-bold text-black-50"> TemplatesJungle</a> </p>
          <p class="secondary-font">Distributed by <a href="https://themewagon.com/" target="_blank"
              class="text-decoration-underline fw-bold text-black-50"> ThemeWagon</a> </p>
        </div>
      </div>
    </div>
  </div>

  <script src="../resources/js/jquery-1.11.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
  <script src="../resources/js/plugins.js"></script>
  <script src="../resources/js/script.js"></script>
  <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</body>
</html>
