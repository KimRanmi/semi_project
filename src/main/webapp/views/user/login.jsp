<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
	<link href='../../resources/css/user/login.css' rel="stylesheet" type="text/css">
</head>
<body>
	<%-- <%@ include file ="../include/new_header.jsp" %> --%>
	
	<section style="margin-top: 150px;">
		<div class="login-container" id="section_wrap" style="margin: 330px auto 0">
			<div class="word">
				<h2>로그인</h2>
			</div>
			<div class="login_form">
				<form action="/user/loginEnd" method="post" name="login_form">
					<label for="user_id">아이디 </label><br>
					<input type="text" id="user_id" name="user_id" required placeholder=" 아이디를 입력해주세요."><br>
					<label for="user_pw">비밀번호 </label><br>
					<input type="password" id="user_pw" name="user_pw" required placeholder=" 비밀번호를 입력해주세요."><br>
					<label>어서오세요! 좋은하루 보내세요.</label><br>
                    
                    
                    
                    <div class="check_btn">
						<button type="button" onclick="loginBtn();">로그인</button>
						<input type="reset" value="초기화">
					</div>
				</form>
			</div>
			<div class="find_id_create_account">
				<a href="/user/findId">아이디 찾기</a>
				<a href="/user/findPw">비밀번호 찾기</a>
				<a href="/user/create">회원 가입</a>
			</div>
		</div>
	
	</section>
	<script>
		function loginBtn(){
			let form = document.login_form;
			if(form.user_id.value == ''){
				alert("아이디를 입력하세요");
				form.user_id.focus();
			} else if(form.user_pw.value == ''){
				alert("비밀번호를 입력하세요");
				form.user_pw.focus();
			} else {
                form.submit();
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