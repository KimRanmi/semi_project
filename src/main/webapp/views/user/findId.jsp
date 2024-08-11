<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/user/findId.css">
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
    <form action="/user/findIdEnd" method="post" name="findIdEnd">
        <label for="user_nick">닉네임</label><br>
        <input type="text" id="user_nick" name="user_nick" required placeholder="닉네임을 입력해주세요."><br>
        <label for="user_email">이메일</label><br>
        <input type="email" id="user_email" name="user_email" required placeholder="이메일을 입력해주세요."><br>
        <button type="submit">아이디 찾기</button>
    </form>
    </div>
    </div>
</body>
</html>