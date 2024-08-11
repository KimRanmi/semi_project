<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href='../../resources/css/include/common.css' rel="stylesheet" type="text/css">
<link href='../../resources/css/user/style.css' rel="stylesheet" type="text/css">

<nav>
    <header>
        <div class="container">
            <nav class="main-menu d-flex navbar navbar-expand-lg">
                <div class="d-flex d-lg-none align-items-end mt-3">
                	<div class="container">
           		 	<div class="logo">
                	<img src="${pageContext.request.contextPath}/resources/images/집.png" alt="Logo">
                	<span>Share Life</span>
           			 </div>
                    <ul class="d-flex justify-content-end list-unstyled m-0">
                        <li>
                            <a href="account.html" class="mx-3">
                                <iconify-icon icon="token:chat" width="24" height="24"></iconify-icon>
                            </a>
                        </li>
                        <li>
                            <a href="wishlist.html" class="mx-3">
                                <iconify-icon icon="mdi:heart" class="fs-4"></iconify-icon>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="mx-3" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSearch"
                                aria-controls="offcanvasSearch">
                                <iconify-icon icon="tabler:search" class="fs-4"></iconify-icon>
                            </a>
                        </li>
                    </ul>
                </div>

                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                    aria-controls="offcanvasNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar"
                    aria-labelledby="offcanvasNavbarLabel">
                    <div class="offcanvas-header justify-content-center">
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>

                    <div class="offcanvas-body justify-content-between">
                        <a class="nav-link dropdown-toggle" role="button" id="pages" data-bs-toggle="dropdown"
                            aria-expanded="false" style="padding-top: 10px; font-size: 20px;">글쓰기</a>
                        <style>
                            section {
                                font-family: "Jua", sans-serif;
                                margin-left: 30%;
                                margin-right: 30%;
                            }

                            .dropdown_icon {
                                margin-bottom: 5px;
                            }

                            .dropdown-menu {
                                font-size: 20px;
                            }
                        </style>
                        <ul class="dropdown-menu" aria-labelledby="pages">
                            <li>
                                <a href="about.html" class="dropdown-item">
                                    <img class="dropdown_icon" src="../../resources/images/질문.png">
                                    질문 게시글
                                </a>
                            </li>
                            <li>
                                <a href="shop.html" class="dropdown-item">
                                    <img class="dropdown_icon" src="../resources/images/판매,나눔.png">
                                    판매/나눔 게시글
                                </a>
                            </li>
                            <li>
                                <a href="single-product.html" class="dropdown-item">
                                    <img class="dropdown_icon" src="../resources/images/번개.png">
                                    번개모임 게시글
                                </a>
                            </li>
                        </ul>
                        <style>
                            .nav-item {
                                padding-left: 50px;
                                font-size: 20px;
                            }
                        </style>
                        <ul class="navbar-nav menu-list list-unstyled d-flex gap-md-3 mb-0">
                            <li class="nav-item">
                                <a href="index.html" class="nav-link active">Home</a>
                            </li>
                            <li class="nav-item">
                                <a href="shop.html" class="nav-link">질문</a>
                            </li>
                            <li class="nav-item">
                                <a href="blog.html" class="nav-link">판매/나눔</a>
                            </li>
                            <li class="nav-item">
                                <a href="contact.html" class="nav-link">번개모임</a>
                            </li>
                        </ul>

                        <div class="d-none d-lg-flex align-items-end">
                            <ul class="d-flex justify-content-end list-unstyled m-0">
                                <li>
                                    <a href="account.html" class="mx-3">
                                        <iconify-icon icon="token:chat" width="24" height="24"></iconify-icon>
                                    </a>
                                </li>
                                <li>
                                    <a href="wishlist.html" class="mx-3">
                                        <iconify-icon icon="mdi:heart" class="fs-4"></iconify-icon>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <div id="nav_wrap">
        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <div class="menu">
                    <ul>
                        <li>
                            <a href="/board/create">게시글 등록</a>
                        </li>
                        <li>
                            <a href="/user/logout">로그아웃</a>
                        </li>
                        <li>
                            <a href="#">계정수정</a>
                        </li>
                    </ul>
                </div>
            </c:when>
            <c:otherwise>
                <div class="menu">
                    <ul>
                        <li>
                            <a href="/user/login">로그인</a>
                        </li>
                        <li>
                            <a href="/user/create">회원가입</a>
                        </li>
                    </ul>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="search">
            <form action="/board/list" name="search_board_form" method="get">
                <input type="text" name="board_title" placeholder="검색하고자하는 게시글의 제목을 입력하세요.">
                <input type="submit" value="검색">
            </form>
        </div>
    </div>
</nav>