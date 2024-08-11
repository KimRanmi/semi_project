<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Share_Life</title>
    <style>
        .table {
            width: 100%;
            border-collapse: collapse;
            text-align: center; /* 전체 텍스트 가운데 정렬 */
        }
        .table th, .table td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: center;
        }
        .table th {
            background-color: #f2f2f2;
        }
        .table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .table tr:hover {
            background-color: #f1f1f1;
        }
        .table .title-column {
            width: 40%; /* 제목 열의 크기 조정 */
        }
        .table .author-column {
            width: 15%; /* 작성자 열의 크기 조정 */
        }
        
        .sort-container {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 10px;
        }
        .sort-container select {
            padding: 5px;
            border: 1px solid #ddd;
        }
        .board-name{
			align-items: left;
	 		text-align: left;
		}
		.board-write{
	    	align-items: right;
		}
    </style>
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
  <link rel="stylesheet" type="text/css" href="../../resources/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="../../resources/css/style.css">
  <link rel="stylesheet" type="text/css" href="../../resources/css/normalize.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/paging.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">

  <style>
body {
    margin: 0;
    padding: 0;
}

header {
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    position: relative;
}

.container {
    max-width: 1200px;
    margin:  auto;
    padding:  15px;
}

.center-table {
    margin: 0 auto;
    text-align: center;
    width: 100%;
}

.center-table thead tr th{
    border: 1px solid #dddddd;
    padding: 10px 3px;
    background-color: #f2f2f2;
    text-align: center;
}
.center-table tbody tr td{
	border:1px solid #dddddd;
	padding: 10px 3px;
	text-align: center;
} 
.mt-5 {
    margin-top: 3rem !important;
}
.mt-3 {
	text-align:right;
	margin: auto;
}
.board-name{
	 align-items: left;
	 text-align: left;
}
.board-write{
	    align-items: right;
}
.search-a{
	 align-items: center;
	 text-align: center;
}
  </style>
</head>
<body>

  <%@ include file="../include/new_header.jsp" %>
  <section class="main-board">
    <div class="container mt-5">
    <div class="board-name">
      <h3 class="mt-5">질문게시판</h3>
      </div>
<div class="board-write">
    <form method="get" action="/qboard/list">
        <select name="sort" onchange="this.form.submit()">
            <option value="latest" <%= request.getParameter("sort") != null && request.getParameter("sort").equals("latest") ? "selected" : "" %>>최신순</option>
            <option value="views" <%= request.getParameter("sort") != null && request.getParameter("sort").equals("views") ? "selected" : "" %>>조회순</option>
            <option value="likes" <%= request.getParameter("sort") != null && request.getParameter("sort").equals("likes") ? "selected" : "" %>>좋아요순</option>
        </select>
    </form>
</div>
      <table class="table mt-3">
        <thead>
          <tr>
            <th>게시글번호</th>
            <th class="title-column">제목</th>
            <th class="author-column">작성자</th>
            <th>작성일</th>
            <th>좋아요수</th>
            <th>조회수</th>
          </tr>
        </thead>
        <tbody>
        <%@ page import="com.cm.common.Paging" %>
          <%@page import="com.cm.qboard.vo.QBoard, java.util.* ,com.cm.user.vo.User" %>
          <%
            List<QBoard> list = (List<QBoard>)request.getAttribute("qbList");
            for(int i = 0 ; i < list.size(); i++){ 
            	QBoard qboard = list.get(i);
                
            %>
              <tr>
                <td class="">
                <a href="<%=request.getContextPath()%>/qboard/detail?post_no=<%=list.get(i).getPostNo()%>"><%=list.get(i).getPostNo()%></a>
                </td>
                <td class="title-column">
                <a href="detail?post_no=<%=list.get(i).getPostNo()%>"><%=list.get(i).getPostTitle()%></a>
                </td class="author-column">
                <td>
                <a href="detail?post_no=<%=list.get(i).getPostNo()%>"><%=list.get(i).getUser().getUser_nick()%></a>
                </td>
                <td>
                <a href="detail?post_no=<%=list.get(i).getPostNo()%>"><%=list.get(i).getPostModDate()%></a>
                </td>
                <td>
                <a href="detail?post_no=<%=list.get(i).getPostNo()%>"><%=list.get(i).getLikeCount()%></a>
                </td>
                <td>
                <a href="detail?post_no=<%=list.get(i).getPostNo()%>"><%= list.get(i).getPostView() %></a>
                </td>																											
              </tr>
          <% } %>
        </tbody>
      </table>
      <form action="/qboard/list" name="search_board_form" method="get" class="search-a mt-3">
          <select name="search_type">
        <option value="title">제목</option>
        <option value="author">작성자</option>
        <option value="title_author">제목 + 작성자</option>
    </select>
    	<%-- <input type="text" name="search_query" placeholder="검색어를 입력하세요.">  --%>
        <input type="text" name="post_title" placeholder="검색하고자하는 게시글의 제목을 입력하세요.">
        <input type="submit" value="검색">
      </form>
  </section>
  
    <%
        Paging paging = (Paging) request.getAttribute("paging");
        if (paging != null) { 
    %>
        <div class="center">
            <div class="pagination">
                <% if (paging.isPrev()) { %>
                    <a href="/qboard/list?nowPage=<%= paging.getPageBarStart() - paging.getPageBarSize() %>&sort=<%= request.getParameter("sort") %>">&laquo;</a>
                <% } else { %>
                    <a>&laquo;</a>
                <% } %>
                <% for (int i = paging.getPageBarStart(); i <= paging.getPageBarEnd(); i++) { %>
                    <a href="/qboard/list?nowPage=<%= i %>&sort=<%= request.getParameter("sort") %>" class="<%= paging.getNowPage() == i ? "active" : "" %>">
                        <%= i %>
                    </a>
                <% } %>
                <% if (paging.isNext()) { %>
                    <a href="/qboard/list?nowPage=<%= paging.getPageBarEnd() + 1 %>&sort=<%= request.getParameter("sort") %>">&raquo;</a>
                <% } else { %>
                    <a>&raquo;</a>
                <% } %>
            </div>
        </div>
    <% } %>
  <footer id="footer" class="my-5">
    <div class="container py-5 my-5">
        <div class="row">
            <div class="col-md-3">
                <div class="footer-menu">
                    <img src="../../resources/images/집.png" alt="logo">
                    <p class="blog-paragraph fs-6 mt-3">Subscribe to our newsletter to get updates about our grand offers.</p>
                   
                </div>
            </div>
            <div class="col-md-3">
                <div class="footer-menu">
                    <h3>Quick Links</h3>
                    <ul class="menu-list list-unstyled">
                        <li class="menu-item">
                            <a href="index.jsp" class="nav-link">Home</a>
                        </li>
                        <li class="menu-item">
                            <a href="/qboard/list" class="nav-link">질문</a>
                        </li>
                        <li class="menu-item">
                            <a href="/sale_share_board/sale_share_board_list" class="nav-link">판매/나눔</a>
                        </li>
                        <li class="menu-item">
                            <a href="/flashmob/list" class="nav-link">번개모임</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3">
                <div class="footer-menu">
                    <h3>Help Center</h5>
                        <ul class="menu-list list-unstyled">
                            <li class="menu-item">
                                <a href="/customerCenter" class="nav-link">고객센터</a>
                            </li>
                            <li class="menu-item">
                                <a href="/admin/inquiryForm" class="nav-link">1:1문의하기</a>
                            </li>
                        </ul>
                </div>
            </div>
            <div class="col-md-3">
                <div>
                    <h3>Our Newsletter</h3>
                    <p class="blog-paragraph fs-6">Subscribe to our newsletter to get updates about our grand offers.</p>
                    <div class="search-bar border rounded-pill border-dark-subtle px-2">
                        <form class="text-center d-flex align-items-center" action="" method="">
                            <input type="text" class="form-control border-0 bg-transparent" placeholder="Enter your email here"/>
                            <iconify-icon class="send-icon" icon="tabler:location-filled"></iconify-icon>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
                                                                    class="text-decoration-underline fw-bold text-black-50"> TemplatesJungle</a></p>
                <p class="secondary-font">Distributed by <a href="https://themewagon.com/" target="_blank"
                                                             class="text-decoration-underline fw-bold text-black-50"> ThemeWagon</a></p>
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
