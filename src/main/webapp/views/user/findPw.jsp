<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/user/findPw.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>
 	<div class="container">
        <div class="logo">
            <img src="../../resources/images/집.png" alt="logo" class="img-fluid" style="height: 30px; width: 30px;">
            <div style="font-size: 40px; padding-left: 15px; margin-top: 5px;">Share Life</div>
        </div>
    <div class="form-container">
    <form action="/user/findPwEnd" method="post">
        <label for="user_id">아이디</label><br>
        <input type="text" id="user_id" name="user_id" required placeholder="아이디를 입력해주세요."><br>
        <label for="user_nick">닉네임</label><br>
        <input type="text" id="user_nick" name="user_nick" required placeholder="닉네임을 입력해주세요."><br>
        <label for="user_question">질문을 선택해주세요.</label><br>
        <select id="user_question" name="user_question" required>
            <option value=0>선택해주세요.</option>
            <option value=1>어머니의 성함은?</option>
            <option value=2>가장 좋아하는 계절은?</option>
            <option value=3>지금 사는 지역은?</option>
            <option value=4>가장 좋아하는 색깔은?</option>
            <option value=5>가장 좋아하는 배우는?</option>
            <option value=6>가장 좋아하는 프로그램은?</option>
            <option value=7>가장 좋아하는 영화는?</option>
            <option value=8>가장 좋아하는 친구는?</option>
            <option value=9>가장 좋아하는 음식은?</option>
            <option value=10>가장 좋아하는 여행지는?</option>
        </select><br>
        <label for="user_answer">답변</label><br>
        <input type="text" id="user_answer" name="user_answer" required placeholder="답변을 입력해주세요."><br>
        <button type="submit">비밀번호 찾기</button>
    </form>
    </div>
    </div>
</body>
</html>