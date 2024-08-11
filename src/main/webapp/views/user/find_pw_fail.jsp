<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 실패</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/user/find_pw_success.css">
</head>
<body>
	<div class="container">
        <div class="logo">
            <img src="../../resources/images/집.png" alt="Share Life">
            <div style="font-size: 40px; padding-left: 15px; margin-top: 5px;">Share Life</div>
        </div>
    <div class="message-container">
    <h4>비밀번호 찾기 실패</h4>
    <p>${error_message}</p>
    <a href="/user/findPw">비밀번호 찾기로 돌아가기</a>
    </div>
    </div>
</body>
</html>