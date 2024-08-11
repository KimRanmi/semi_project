<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
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
        <link rel="stylesheet" type="text/css" href="../../resources/css/createSale.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
<style> 
	 #heart{width: 20px;}
        .red{fill:red;}
        .dark{fill:#ddd;}
</style>   
</head>
<body>
	<%@ include file="../include/new_header.jsp" %>
    <%@ page import ="com.cm.sale_share_board.vo.SaleShareList, java.util.*" %>
        <%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
        <%@ page import="java.time.Duration, java.time.format.DateTimeFormatter" %>
        <% SaleShareList list = (SaleShareList)request.getAttribute("list");%>
        <% User u = (User)session.getAttribute("user"); %>
	<section id="section_id">
		<span class="user-nic">
   		<%= list.getUser_nic() %>
		</span>
		<% if(u != null){ %>
        <% boolean result = (Boolean)request.getAttribute("boolean"); %>
		<span class="chat-button">
    		<a href="/user/msgForm" id="chat_id">쪽지</a>
            <a href="#" id="likeId" onclick="change(<%= list.getPost_no()%>,event)">
             <svg id="heart" class="<%= !result ? "dark" : "red" %>" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
        	<path d="M47.6 300.4L228.3 469.1c7.5 7 17.4 10.9 27.7 10.9s20.2-3.9 27.7-10.9L464.4 300.4c30.4-28.3 47.6-68 47.6-109.5v-5.8c0-69.9-50.5-129.5-119.4-141C347 36.5 300.6 51.4 268 84L256 96 244 84c-32.6-32.6-79-47.5-124.6-39.9C50.5 55.6 0 115.2 0 185.1v5.8c0 41.5 17.2 81.2 47.6 109.5z"/>
			</svg> 
        	</a>   
		</span>
		<%} %>
        <form action="/views/sale_share_board/createEnd" method="post" enctype="multipart/form-data" id="form_id" name="form_id">
            <div class="form_group">
                <img src="../../upload/<%= list.getImage_new_name() %>" width="200px" height="200px">
            </div>
            <div class="form_group">
                <p><label for="prod_id">상품명</label>
                <input type="text" id="prod_id" name="post_title" placeholder="text" value="<%= list.getPost_title() %>" disabled><br><br>
                <label for="price_id" id="price_label">가격</label>
                <input type="number" id="price_id" name="prod_price" value="<%= list.getProd_price() %>" disabled>
                <label>나눔</label>
                <input type="checkbox" id="free_checkBox"><br><br>
                <label for="place" id="place_label" >거래장소</label>
                <input type="text" id="place" name="place" value="서울시 <%= list.getLocal_gu_name() %>" disabled><br>
                <br>
                <label>카테고리</label>
                <select name="prod_cate" disabled>
                    <option>
                    <% switch(list.getProd_cate()){
                    	case 1 : out.print("가구"); break;
                    	case 2 : out.print("식품"); break;
                    	case 3 : out.print("가전"); break;
                    	case 4 : out.print("의류"); break;
                    	default : out.print("기타"); 
                    	}%>
                    </option>
                </select>
                <br><br>
                 <label>거래상태</label>
                <select name="deal_status" disabled>
                	<option>
                    <% switch(list.getDeal_status()) {
                    	case 0 : out.print("거래중"); break;
                    	case 1 : out.print("예약중"); break;
                    	case 2 : out.print("거래완료"); break;
                    	}%>
                	</option>
                </select>
            </div>
            <div class="form_group">
                <div class="textarea-container">
                    <label for="description">설명</label>
                    <textarea placeholder="자세한 설명 글 올리기" id="description" name="post_text" disabled><%= list.getPost_title() %></textarea>
                </div>
            </div>
        </form>
        <!-- 뒤로가기 -->
        <input type="button" value="목록" onclick="location.href='<%= request.getContextPath() %>/sale_share_board/sale_share_board_list';" style="float:right; margin-right :20px">
        <!-- 수정하기 -->
        <% int user_no = list.getUser_no(); %>
        
        <% if (u != null && u.getUser_no() == user_no) {%>
        <a href="<%= request.getContextPath() %>/sale_share_board/sale_share_board_edit?id=<%= list.getPost_no()%>"> 수정하기</a>
        <a href="<%= request.getContextPath() %>/sale_share_board/sale_share_board_delete?id=<%= list.getPost_no() %>">삭제하기</a>
        <a href="<%= request.getContextPath() %>/sale_share_board/sale_share_board_pull?id=<%=list.getPost_no() %>">끌어올리기</a>
        <%} else{ %>
        <%} %>
    </section>
    <script>
	    document.addEventListener("DOMContentLoaded", function() {
	        var text_price = document.getElementById("price_id").value;
	        console.log("가격"+text_price);
	        var free_checkBox = document.getElementById("free_checkBox");
	        free_checkBox.checked = (text_price == 0);
	        free_checkBox.disabled = true; // 체크박스 disabled 상태로 변환
	    });
	
	    function change(postNo, event) {
	        event.preventDefault();
	        console.log(postNo);
	
	        var xhr = new XMLHttpRequest();
	        xhr.open("GET", "<%= request.getContextPath() %>/sale_share_board/like?id=" + postNo);
	        xhr.onload = function() {
	            if (xhr.status >= 200 && xhr.status < 400) {
	                var heart = document.getElementById('heart'); //하트 상태 변화
	                if (heart.classList.contains('red')) {
	                    heart.classList.remove('red');
	                    heart.classList.add('dark');
	                } else {
	                    heart.classList.remove('dark');
	                    heart.classList.add('red');
	                }
	        	};
	        	xhr.send();
	    	}
	    }
	</script>
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