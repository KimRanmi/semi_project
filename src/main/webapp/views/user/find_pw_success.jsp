<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 성공</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/user/find_pw_success.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container">
        <div class="logo">
            <img src="../../resources/images/집.png" alt="Share Life">
            <div style="font-size: 40px; padding-left: 15px; margin-top: 5px;">Share Life</div>
        </div>
    <div class="message-container">
    <h4>비밀번호 찾기 성공</h4>
    <p>비밀번호: ${userPw}</p>
    <a href="/user/login">로그인</a>
    </div>
    </div>
</body>
</html>