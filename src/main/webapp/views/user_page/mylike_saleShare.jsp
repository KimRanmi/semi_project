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

<link rel="stylesheet" type="text/css" href="../../resources/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/normalize.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/paging.css">
        <link rel="stylesheet" type="text/css" href="../../resources/css/sale_share_list.css">
        
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap"
  rel="stylesheet">
  <script type="text/javascript" src="jquery-3.7.1.js"></script>
<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
</head>
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
<body>
<%@ include file="../include/new_header.jsp" %>

<section style="margin-top:250px;">
	<div class="container_div">
		<div style="font-size:40px;">내 게시글</div>
		<div>
			<button class="inactive" type="button" style="float:left" onclick="qboard_page();">질문</button>
			<button class="active" type="button" style="float:left" onclick="saleShare_page();">판매/나눔</button>
			<button class="inactive" type="button" style="float:left" onclick="flashmob_page();">모임</button>
		</div>
		<div class="post" style="margin-top:100px;">
        <%@ page import ="com.cm.sale_share_board.vo.SaleShareList, java.util.*" %>
        <%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
        <%@ page import="java.time.Duration, java.time.format.DateTimeFormatter" %>
        <div id="section_wrap">
        <div class="book_list">
        	<table>
        		<colgroup>
        			<col width="15%">
        			<col width="20%">
        			<col width="15%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
					<col width="15%">
        	<thead>
						<tr>
							<th class="table_text">사진</th>
							<th class="table_text">제목</th>
							<th class="table_text">금액</th>
							<th class="table_text">작성자</th>
							<th class="table_text">시간</th>
							<th class="table_text">조회수</th>
							<th class="table_text">좋아요</th>
						</tr>
			</thead>
			<tbody>
            <% List<SaleShareList> list = (List<SaleShareList>)request.getAttribute("list");%>
           <% for(int i = 0; i < list.size(); i++) {
                SaleShareList board = list.get(i);
            %>
            <tr>
            	<td><img style="width:200px; height:200px;" src="<%= request.getContextPath() %>/upload/<%= board.getImage_new_name() %>" alt="Product Image"></td>
            	<!-- servlet 경로설정 -->
            	<td><a href="<%= request.getContextPath() %>/sale_share_board/sale_share_board_detail?id=<%= board.getPost_no() %>"><%= board.getPost_title() %></a>
            		<% 
						String dealText = ""; 
            			String color = "";
            			switch(board.getDeal_status()){
            				case 0 : dealText = ""; break;
            				case 1 : dealText = "예약중"; color = "green"; break;
            				case 2 : dealText = "거래완료"; color = "red"; break;
            		} %>
            		<span style="color:<%= color %>; font_size ='12'"><%= dealText %></span>
            	</td>
            	<td><%= board.getProd_price() %>원</td>
            	<td><%= board.getUser_nic() %></td>
            	<td><%
                		LocalDateTime now = LocalDateTime.now();
                		LocalDateTime regDate = list.get(i).getProd_reg_date();
                		
                		// 두 날짜 사이의 차이 계산
                		Duration durationDay = Duration.between(regDate,now);
                		
                		// 초 단위로 변환
                		long secondsDiff = durationDay.getSeconds();
                		
                		if(secondsDiff < 60){%>
							<%= secondsDiff +"초 전" %>
							<% } else if(secondsDiff < 3600){ 
								long minutesDiff = secondsDiff /60 ;%>
								<%= minutesDiff +"분 전" %>
								<%}else if(secondsDiff < 86400){ 
								long hoursDiff = secondsDiff / 3600;%>
								<%= hoursDiff + "시간 전" %>
								<%}else{
									DateTimeFormatter dft = DateTimeFormatter.ofPattern("yy-MM-dd");
									String formattedDate = dft.format(regDate); %>
									<%= formattedDate %>
								<% }%>
            </td>
            <td class="table_text"><%= board.getPost_view() %></td>
            <td class="table_text"><%= board.getLike_status() %></td>
            </tr>
            <% } %>
            </tbody>
            </table>
    	</div>
    	</div>
   <% SaleShareList paging = (SaleShareList)request.getAttribute("paging");%>
	<% if(paging != null){ %>
		<div class="center"  style="margin-top:50px; margin-left:45%;">
			<div class="pagination">
				<% if(paging.isPrev()){ %>
					<a href="/user/MyboardSaleShare?nowPage=<%=(paging.getPageBarStart()-1)%>">
						&laquo;
					</a>
				<%}%>
				<% for(int i = paging.getPageBarStart() ; i <= paging.getPageBarEnd() ; i++) {%>
					<a href="/user/MyboardSaleShare?nowPage=<%=i%>" 
					<%=paging.getNowPage() == i ? "class='active'" : ""%>>
						<%=i%>
					</a>
				<%}%>
				<% if(paging.isNext()){%>
					<a href="/user/MyboardSaleShare?nowPage=<%=(paging.getPageBarEnd()+1)%>">&raquo;</a>
				<%}%>
			</div>
		</div>
	<% } %>
	</div>
	</div>
</section>
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

</body>
</html>