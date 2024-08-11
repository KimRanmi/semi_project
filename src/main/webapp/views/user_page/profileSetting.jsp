<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ page import="com.cm.user.vo.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 설정</title>
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
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
<style>
        body {
            font-family: 'Jua', sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        .profile-img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 20px;
        }
        .input-group {
            margin-bottom: 15px;
            text-align: left;
        }
        .input-group label {
            display: block;
            margin-bottom: 5px;
        }
        .input-group input, .input-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .input-group .error {
            color: red;
            font-size: 14px;
        }
        .char-counter {
            text-align: right;
            font-size: 12px;
            color: #999;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
        }
        .button-group button {
            width: 45%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .btn-save {
            background-color: #ff7f7f;
            color: white;
        }
        .btn-cancel {
            background-color: #f8d7da;
        }
        .btn-save:hover {
            background-color: #ff4f4f;
        }
        .btn-cancel:hover {
            background-color: #f5c6cb;
        }
    </style>
</head>
<body>
	<div class="container">
        <h2>프로필 설정</h2>
        <% 
            User pro = (User) request.getAttribute("pro"); 
            if (pro != null) { 
        %>
        <%-- <img src="<%= user.getProfile_new_image_name() != null ? request.getContextPath() + "../../resources/images/" + user.getProfile_new_image_name() : request.getContextPath() + "/resources/images/default-profile.png" %>" alt="프로필 이미지" class="profile-img mb-3"> --%>
        <form action="<%= request.getContextPath() %>/user/profileSettingEnd" method="post" name="peofile_form">
        <div class="input-group">
        <%-- <% User u = new User(); %> --%>
            <label for="nickname">닉네임</label>
            <input type="text" id="nickname" name="nickname" value="<%= pro.getUser_nick() %>">
            <span class="error" id="nickname-error"><%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "중복된 닉네임입니다." %></span>
            <div class="char-counter"><span id="nickname-counter"><%= pro.getUser_nick().length() %></span>/10</div>
        </div>
        <div class="input-group">
            <label for="bio">자기소개</label>
            <textarea id="bio" name="bio" placeholder="간단한 자기소개를 입력하세요." maxlength="50"required><%= pro.getProfile_text() %></textarea>
            <div class="char-counter"><span id="bio-counter"><%= pro.getProfile_text().length() %></span>/50</div>
        </div>
        <div class="button-group">
            <button type="submit" class="btn-save">설정</button>
            <button type="button" class="btn-cancel"onclick="cancelProfile()">취소</button>
        </div>
        </form>
        <% } else { %> <!-- userProfile이 null인 경우 처리 -->
        <p>사용자 정보를 불러올 수 없습니다.</p>
        <% } %>
    </div>
	
    
    <script>
 // 닉네임 입력란이 존재하는 경우에만 이벤트 리스너를 추가
    let nicknameInput = document.getElementById('nickname');
        let nicknameError = document.getElementById('nickname-error');
        let nicknameCounter = document.getElementById('nickname-counter');

        if (nicknameInput) {
            nicknameInput.addEventListener('input', function() {
                nicknameCounter.innerText = this.value.length;
                if (this.value.length <= 10) {
                    nicknameError.innerText = "";
                } else {
                    nicknameError.innerText = "닉네임은 10자 이하이어야 합니다.";
                }
            });
        }

        let bioInput = document.getElementById('bio');
        let bioCounter = document.getElementById('bio-counter');

        if (bioInput) {
            bioInput.addEventListener('input', function() {
                bioCounter.innerText = this.value.length;
            });
        }

    function cancelProfile() {
        // 취소 로직 추가
        alert('프로필 설정이 취소되었습니다.');
        window.location.href = '<%= request.getContextPath() %>/user/userMyPage';
    }
    </script>
	
<script src="<%= request.getContextPath() %>../../resources/js/jquery-1.11.0.min.js"></script>
<script src="<%= request.getContextPath() %>../../resources/js/plugins.js"></script>
<script src="<%= request.getContextPath() %>../../resources/js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</body>
</html>