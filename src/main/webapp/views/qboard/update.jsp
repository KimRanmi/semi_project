<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Share_Life</title>
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

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap"
    rel="stylesheet">
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

.center-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    margin: 0 auto;
    max-width: 1200px;
    padding-top: 20px; 
}

.center-table {
    margin: 0 auto;
    text-align: center;
    width: 100%;
}

.center-table thead tr th, .center-table tbody tr td {
    border: 1px solid #e1e1e1;
    padding: 10px 3px;
    background-color: #a5a5a5;
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
  </style>
</head>
<body>

<%@ include file="../include/new_header.jsp" %>
<%@ page import="com.cm.qboard.vo.QBoard , java.util.*" %>
<section>
    <div class="container mt-5">
        <h2>게시글 수정</h2>
    </div>
    <div class="container mb-3">
        <%
            QBoard qboard = (QBoard) request.getAttribute("qboard");
        %>
        <form action="/qboard/updateEnd" name="update_board_form" enctype="multipart/form-data" method="post">
            <input type="hidden" name="post_no" value="<%= qboard.getPostNo() %>">
                <label for="postTitle" class="form-label">제목</label>
                <input type="text" class="form-control" id="postTitle" name="post_title" value="<%= qboard.getPostTitle() %>">
                <label for="existingFileName" class="form-label">기존 파일 이름</label>
                <input type="text" class="form-control" id="existingFileName" value="<%= qboard.getImageOriName() %>" readonly>  
                <label for="imageName" class="form-label">새 파일 업로드</label>
                <input type="file" class="form-control-file" id="imageName" name="imageName" accept=".png,.jpg,.jpeg">
                <label for="postText" class="form-label">내용</label>
                <textarea class="form-control" id="postText" name="post_text" rows="5"><%= qboard.getPostText() %></textarea>
                <label for="post_release_yn" class="form-label">게시 여부 (Y/N)</label>
                <input type="text" class="form-control" id="post_release_yn" name="post_release_yn" value="<%= qboard.getPostReleaseYn() %>">
            <button type="submit" class="btn btn-primary">등록</button>
            <button type="reset" class="btn btn-secondary">취소</button>
            <a href="/qboard/list" class="btn btn-secondary">뒤로가기</a>
        </form>
    </div>
</section>

	<script type="text/javascript">
		function updateBoardForm() {
			let form = document.forms["update_board_form"];	
			console.log("Form is being submitted"); // 폼 제출 로그 추가
			if(!form.post_title.value){
				alert("제목을 입력하세요.");
				form.post_title.focus();
			} else if(!form.post_text.value){
				alert("내용을 입력하세요.");
				form.post_text.focus();
			} 	else if(form.imageName.value){
				const val = form.imageName.value;
				const idx = val.lastIndexOf('.');
				const type = val.substring(idx+1, val.length);
				if(type == 'jpg' || type == 'jpeg' || type == "png"){
					form.submit();
				}else{
					alert("이미지 파일만 선택할 수 있습니다.")
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

  <script src="../../resourse/js/jquery-1.11.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
  <script src="../../resources/js/plugins.js"></script>
  <script src="../../resources/js/script.js"></script>
  <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</body>
</html>
