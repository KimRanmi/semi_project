<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
    <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
<meta charset="UTF-8">
</head>
<body>
<%@ include file ="../include/new_header.jsp" %>
<style>
		.received_msg {
	    background-color: #0d6efd;
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
	
	.received_msg:hover {
	    background-color: #0a58ca; /* 마우스 호버 시 색상 변화 */
	}
	
		.sent_msg {
	    background-color: #4c9cf7;
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
	
	.sent_msg:hover {
	    background-color: #1d8cf8; /* 마우스 호버 시 색상 변화 */
	}
</style>
	<br><br>
	<section style="margin-top:200px;">
    	<div id="section_wrap">
    		<div class="word" style="font-size:40px; text-align:left;">판매/나눔 게시판</div>
    		<div style="margin-top:20px;">
	        	<a href="/sale_share_board/sale_share_board_cate?key='all'">
	        		<button class="received_msg" type="button" style="float:left">전체</button>
	        	</a>
	        	<a href="/sale_share_board/sale_share_board_cate?key='sell'">
					<button class="sent_msg" type="button" style="float:left">판매</button>
	        	</a>
		        <a href="/sale_share_board/sale_share_board_cate?key='share'">
	        		<button class="sent_msg" type="button" style="float:left">나눔</button>
	        	</a>
			</div>
			<div style="float:right; margin-top:70px;">
			     <form action="/sale_share_board/share_array" method="post" id="arrayForm">
			      <select name="array" onchange="arrayForm();" id="arraySelect">
					<option value="0">-------</option>
					<option value="1">가격낮은순</option>
			    	<option value="2">조회순</option>
			    	<option value="3">좋아요순</option>
			    	</select>
			    </form>
	    	</div>
    	</div>
    	<div class="post" style="margin-top:50px;">
    	<% List<SaleShareList> list = (List<SaleShareList>)request.getAttribute("resultList");%>
        <%@ page import ="com.cm.sale_share_board.vo.SaleShareList, java.util.*" %>
        <%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
        <%@ page import="java.time.Duration, java.time.format.DateTimeFormatter" %>
        <div id="section_wrap">
	        <div class="book_list">
	        	<table>
	        		<colgroup>
	        			<col width="20%">
	        			<col width="20%">
	        			<col width="10%">
						<col width="15%">
						<col width="15%">
						<col width="10%">
						<col width="10%">
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
	            
	
	           <% for(int i = 0; i < list.size(); i++) {
	                SaleShareList board = list.get(i);
	            %>
	            <tr>
	            	<td class="table_text"><img style="width:200px; height:200px;" src="<%= request.getContextPath() %>/upload/<%= board.getImage_new_name() %>" alt="Product Image"></td>
	            	<!-- servlet 경로설정 -->
	            	<td class="table_text"><a href="<%= request.getContextPath() %>/sale_share_board/sale_share_board_detail?id=<%= board.getPost_no() %>"><%= board.getPost_title() %></a>
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
	            	<td class="table_text"><%= board.getProd_price() %>원</td>
	            	<td class="table_text"><%= board.getUser_nic() %></td>
	            	<td class="table_text"><%
	            			LocalDateTime nowTime= LocalDateTime.now();
            		LocalDateTime regDate = list.get(i).getProd_reg_date();
            		
            		// 두 날짜 사이의 차이 계산
            		Duration duration = Duration.between(regDate,nowTime);
	                		
	                		// 초 단위로 변환
	                		long secondsDiff = duration.getSeconds();
	                		
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
    	</div>
   <% SaleShareList paging = (SaleShareList)request.getAttribute("paging");%>
	<% if(paging != null){ %>
		<div class="center">
			<div class="pagination">
				<% if(paging.isPrev()){ %>
					<a href="/sale_share_board/sale_share_board_list?nowPage=<%=(paging.getPageBarStart()-1)%>">
						&laquo;
					</a>
				<%}%>
				<% for(int i = paging.getPageBarStart() ; i <= paging.getPageBarEnd() ; i++) {%>
					<a href="/sale_share_board/sale_share_board_list?nowPage=<%=i%>" 
					<%=paging.getNowPage() == i ? "class='active'" : ""%>>
						<%=i%>
					</a>
				<%}%>
				<% if(paging.isNext()){%>
					<a href="/sale_share_board/sale_share_board_list?nowPage=<%=(paging.getPageBarEnd()+1)%>">&raquo;</a>
				<%}%>
			</div>
		</div>
	<% } %>
		<form action="/sale_share/searchList" method="get" style="margin:0 auto; text-align:center;">
    	<select name="search" style="height:25px;">
        	<option value="1">제목</option>
        	<option value="2">내용</option>
    	</select>
    	<input type="text" placeholder="검색해주세요" name="search_text" id="search_text">
    	<input type="submit" value="검색">
	</form>
</section>
<script>
function arrayForm() {
    var arrayForm = document.getElementById("arrayForm");
    arrayForm.submit();
}
</script>

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
<script src="js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="js/plugins.js"></script>
<script src="js/script.js"></script>
<script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</body>
</html>
