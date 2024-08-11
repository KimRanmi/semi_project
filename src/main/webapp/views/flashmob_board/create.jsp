<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="../../resources/css/flashmob/create.css">
<title>Insert title here</title>
</head>
<body>
<%@ page import = "com.cm.user.vo.User" %>
<%@ include file ="../include/new_header.jsp" %>
	<section style="margin-top:250px;">
		<div id="section_wrap">
			<div class="word">
				<h3>게시글 등록</h3>
			</div><br>
			<div class="register_book_form">
				<form action="${pageContext.request.contextPath}/flashmob/createEnd" name="create_flashmob_form" method="post" enctype="multipart/form-data">	
					<label for="flashmob_post_title">제목 : </label>
					<input type="text" name="flashmob_post_title" id="flashmob_post_title" placeholder="제목을 입력하세요."> <br>
					<label for="flashmob_location">장소 : </label>
					<input type="text" name="flashmob_location" id="flashmob_location" placeholder="장소를 입력하세요." readonly> <br>
					<label for="flashmob_post_time">일정 선택 : </label>
					<input type="datetime-local" name="flashmob_time" id="flashmob_time"><br>
					<label for="flashmob_number">인원 선택 : </label>
					<select name="flashmob_number" id="flashmob_number">
            			<option value="1">1</option>
            			<option value="2">2</option>
            			<option value="3">3</option>
            			<option value="4">4</option>
            			<option value="5">5</option>
        			</select><br>
        			<label for="flashmob_post_text">내용 : </label>
					<input type="text" name="flashmob_post_text" id="flashmob_post_text" placeholder="내용을 입력하세요."><br>
					<label for="thumbnail">사진</label>
					<input type="file" name="thumbnail" id="thumbnail" accept=".png,.jpg,.jpeg" multiple><br>
					<input type="checkbox" name="privacy" id="privacy">
					<label for="privacy">비공개</label>
					<input type="button" value="등록" onclick="createBoardForm();"> 
					<input type="reset" value="취소">
				</form>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		function createBoardForm() {
			let form = document.forms["create_flashmob_form"];	
			if(!form["flashmob_post_title"].value){
				alert("제목을 입력하세요.");
				form["flashmob_post_title"].focus();
			}else if(!form["flashmob_location"].value){
				alert("장소를 입력하세요.");
				form["flashmob_location"].focus();
			}else if(!form["flashmob_time"].value){
				alert("일정을 입력하세요.");
				form["flashmob_time"].focus();
			}else if(!form["flashmob_number"].value){
				alert("인원을 입력하세요.");
				form["flashmob_number"].focus();
			}else if(!form["flashmob_post_text"].value){
				alert("내용을 입력하세요.");
				form["flashmob_post_text"].focus();
			}else if(!form["thumbnail"].value){
				form.submit();
			}else if(form["thumbnail"].value){
				const val = form["thumbnail"].value;
				const idx = val.lastIndexOf('.');
				const type = val.substring(idx+1,val.length);
				if(type == 'jpg' || type == 'jpeg' || type == "png"){
					form.submit();
				} else{
					alert("이미지 파일만 선택할 수 있습니다.");
					form["thumbnail"].value = '';
				}
			}
		}
	</script>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("flashmob_location").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("flashmob_location").value = data.address; // 주소 넣기
            }
        }).open();
    });
}
</script>
</html>