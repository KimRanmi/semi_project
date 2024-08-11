<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Share_Life</title>
  <meta charset="utf-8">
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

<link rel="stylesheet" type="text/css" href="css/vendor.css">
<link rel="stylesheet" type="text/css" href="style.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap"
  rel="stylesheet">
  <script type="text/javascript" src="jquery-3.7.1.js"></script>
<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
<link href="../../resources/css/flashmob_list.css" rel="stylesheet" type="text/css">
</head>

<body>
<%@ include file ="userMypageHeader.jsp" %>
<style>
	.container_div{
		width: 1300px;
        margin:0 auto;	
	}
	.inactive{
	background-color: #4c9cf7;
      color: white;
      border: none;
      font-size: 20px;
      cursor: pointer;
      width: 120px;
      height: 60px;
      align-items: center;
      justify-content: center;
      font-weight:lighter;
      border:1px solid white;
	}
	
	.inactive:hover {
    background-color: #1d8cf8; /* 마우스 호버 시 색상 변화 */
	}	
	.active {
	    background-color: #0d6efd; /* 진한 파란색으로 변경 */
	    color: white;
	    border: none;
	    font-size: 20px;
	    cursor: pointer;
	    width: 120px;
	    height: 60px;
	    align-items: center;
	    justify-content: center;
	    font-weight: lighter;
	    border: 1px solid white;
	}
	.active:hover {
	    background-color: #0a58ca; /* 마우스 호버 시 색상 변화 */
	}

  
</style>
<script>
	const qboard_page = function(){
		window.location.href = '/user/MyboardQboard';
	}
	const saleShare_page = function(){
		window.location.href = '/user/MyboardSaleShare';
	}
	const flashmob_page = function(){
		window.location.href = '/user/MyboardFlashmob';
	}
</script>

<section style="margin-top:250px;">
	<div class="container_div">
		<div style="font-size:40px;">내 게시글</div>
		<div>
			<button class="inactive" type="button" style="float:left" onclick="qboard_page();">질문</button>
			<button class="inactive" type="button" style="float:left" onclick="saleShare_page();">판매/나눔</button>
			<button class="active" type="button" style="float:left" onclick="flashmob_page();">모임</button>
		</div>
		<div id="section_wrap">
			<div class="word">
				<span style="font-size:20px; float:right; margin-top:30px;">
					<a href="/flashmob/list?sort=latest">최신순</a>
	            	<a href="/flashmob/list?sort=view">조회순</a>
	            	<a href="/flashmob/list?sort=like">좋아요순</a>
            	</span>
			</div>
			<div class="book_list" style="margin-top:29px;">
			<table>
				<colgroup>
					<col width="5%">
					<col width="20%">
					<col width="40%">					
					<col width="15%">
					<col width="10%">
					<col width="5%">
					<col width="5%">
				</colgroup>
				<thead>
					<tr>
						<th class="table_text">번호</th>
						<th class="table_text">지역</th>
						<th class="table_text">제목</th>
						<th class="table_text">작성일</th>
						<th class="table_text">작성자</th>
						<th class="table_text">조회수</th>
						<th class="table_text">좋아요</th>
					</tr>
				</thead>
				<tbody>
					<%@ page import="com.cm.flashmob.vo.Flashmob, java.text.SimpleDateFormat,java.util.*" %>
					<%@page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
					<% 	List<Flashmob> list = (List<Flashmob>)request.getAttribute("mywrite");
					DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
					
						for(int i=0;i<list.size();i++){%>
							<tr>
								<td class="table_text"><%=list.get(i).getPost_no() %></td>
								<td class="table_text"><%=list.get(i).getFlashmob_location() %></td>
								<td class="table_text"><a href="/flashmob/check?post_no=<%=list.get(i).getPost_no()%>"><%=list.get(i).getPost_title() %></a></td>
								<td class="table_text"><%=dtf.format(list.get(i).getPost_reg_date())%></td>
								<td class="table_text"><%=list.get(i).getUser_nick() %></td>
								<td class="table_text"><%=list.get(i).getFlashmob_post_view() %></td>
								<td class="table_text"><%=list.get(i).getLike_count() %></td>

							</tr>
						<%} %>
				</tbody>
				</table>
			</div>
		</div>
	</div>
</section>


</body>
</html>