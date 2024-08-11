<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href='../../resources/css/include/common.css' rel="stylesheet" type="text/css">
<link href='../../resources/css/include/header.css' rel="stylesheet" type="text/css">

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Share Life</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
</head>
<body>
    <header class="header_wrap">
        <div class="container">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/resources/images/집.png" alt="Logo">
                <span>Share Life</span>
            </div>
            <div class="search-bar">
                <input type="text" placeholder="통합검색">
                <button><img src="${pageContext.request.contextPath}/resources/images/search-icon.png" alt="Search"></button>
            </div>
            <div class="header-links">
                <a href="${pageContext.request.contextPath}/">홈</a>
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/user/userMyPage">마이페이지</a>
                        <a href="${pageContext.request.contextPath}/user/logout">로그아웃</a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/user/login">로그인</a>
                        <a href="${pageContext.request.contextPath}/user/create">회원가입</a>
                    </c:otherwise>
                </c:choose>
                <a href="${pageContext.request.contextPath}/customerService">고객센터</a>
            </div>
        </div>
    </header>
</body>
</html>