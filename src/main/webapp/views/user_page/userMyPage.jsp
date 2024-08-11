<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cm.user.vo.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
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
	<!-- <link href='../../resources/css/user/userMyPage.css' rel="stylesheet" type="text/css"> -->

	<style>
        /* /* 기존 스타일에서 추가 및 수정 부분 */
        .card-body {
            text-align: center;
            width: 100%;
        }
        .profile-img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
        }
        .nav-pills .nav-link {
            background-color: #f8d7da;
            margin-bottom: 10px;
        }
        .nav-pills .nav-link.active {
            background-color: #f5c6cb;
        }
        .tab-content .card {
            margin-top: 20px;
        }
        .tab-content {
            width: 100%;
        }
        .btn-primary {
            background-color: #f5c6cb;
            border: none;
        }
        .btn-primary:hover {
            background-color: #f8d7da;
        }
        .profile-card {
            max-width: 600px;
            margin: 0 auto;
        } */
    </style>
</head>
<body>
<header>
    <div class="container py-2">
        <div class="row py-4 pb-0 pb-sm-4 align-items-center">
            <div class="col-sm-4 col-lg-3 text-center text-sm-start">
                <div class="main-logo">
                    <a href="../../index.jsp" style="display: flex; align-items: center;">
                        <img src="../../resources/images/집.png" alt="logo" class="img-fluid" style="height: 30px; width: 30px;">
                        <div style="font-size: 40px; padding-left: 15px; margin-top: 5px;">Share Life</div>
                    </a>
                </div>
            </div>
            <div style="padding-left: 50px;" class="col-sm-6 offset-sm-2 offset-md-0 col-lg-5 d-none d-lg-block">
                <div class="search-bar border rounded-2 px-3 border-dark-subtle">
                    <form id="search-form" class="text-center d-flex align-items-center" action="" method="">
                        <input type="text" class="form-control border-0 bg-transparent"
                               placeholder="통합검색" style="padding-left: 20px; padding-top: 23px;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <path fill="currentColor"
                                  d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z"/>
                        </svg>
                    </form>
                </div>
            </div>
            <%
				User user = (User)session.getAttribute("user");
				if(user == null){
			%>
            <div class="col-sm-8 col-lg-4 d-flex justify-content-end gap-5 align-items-center mt-4 mt-sm-0 justify-content-center justify-content-sm-end">
                <div class="support-box text-end d-none d-xl-block">
                	<a href="/user/login">
                    <span class="fs-6 secondary-font text-muted">로그인</span>
                    </a>
                </div>
                <div class="support-box text-end d-none d-xl-block">
                	<a href="/user/create">
                    	<span class="fs-6 secondary-font text-muted">회원가입</span>
                    </a>
                </div>
                <div class="support-box text-end d-none d-xl-block">
                    <a href="/customerCenter">
                        <span class="fs-6 secondary-font text-muted">고객센터</span>
                    </a>
                </div>
            </div>
            <% } else {
            	if("admin1234".equals(user.getUser_id())){%>
            	<div class="col-sm-8 col-lg-4 d-flex justify-content-end gap-5 align-items-center mt-4 mt-sm-0 justify-content-center justify-content-sm-end"> 
     			<div class="support-box text-end d-none d-xl-block"> 
     				<a href="/inquiryBoard/list">
     				<span class="fs-6 secondary-font text-muted">마이페이지</span>
     				</a>
     			</div>
     			<div class="support-box text-end d-none d-xl-block"> 
     				<a href="/user/logout">
     				<span class="fs-6 secondary-font text-muted">로그아웃</span> 
     				</a>
     			</div>
     			<div class="support-box text-end d-none d-xl-block">
                    <a href="/customerCenter">
                        <span class="fs-6 secondary-font text-muted">고객센터</span>
                    </a>
                </div> 
     		</div>
     		<%}else{ %>
            <div class="col-sm-8 col-lg-4 d-flex justify-content-end gap-5 align-items-center mt-4 mt-sm-0 justify-content-center justify-content-sm-end"> 
     			<div class="support-box text-end d-none d-xl-block"> 
     				<a href="/user/userMyPage">
     				<span class="fs-6 secondary-font text-muted">마이페이지</span>
     				</a>
     			</div>
     			<div class="support-box text-end d-none d-xl-block"> 
     				<a href="/user/logout">
     				<span class="fs-6 secondary-font text-muted">로그아웃</span> 
     				</a>
     			</div>
     			<div class="support-box text-end d-none d-xl-block">
                    <a href="/customerCenter">
                        <span class="fs-6 secondary-font text-muted">고객센터</span>
                    </a>
                </div> 
     		</div>
     		<%}%>
     	<%}%>
     </div>
     </div>
     
       
    <div class="container-fluid">
        <hr class="m-0">
    </div>
    <div class="container">
        <nav class="main-menu d-flex navbar navbar-expand-lg ">
            <div class="d-flex d-lg-none align-items-end mt-3">
                <ul class="d-flex justify-content-end list-unstyled m-0">
                    <li>
                    <%
						if(user == null){
					%>
                    	    <a href="/user/login" class="mx-3">
                            <iconify-icon icon="system-uicons:paper-plane" width="26" height="26"></iconify-icon>
                        	</a>
                        	<% }else{%>
	                        <a href="/receivedMsg/list" class="mx-3">
	                            <iconify-icon icon="system-uicons:paper-plane" width="26" height="26"></iconify-icon>
	                        </a>
                        <% }%>
                    </li>
                    <li>
                    <%
						if(user == null){
					%>
                    	    <a href="/user/login" class="mx-3">
                            <iconify-icon icon="mdi:heart" class="fs-4"></iconify-icon>
                        	</a>
                        	<% }else{%>
	                        <a href="" class="mx-3">
	                            <iconify-icon icon="mdi:heart" class="fs-4"></iconify-icon>
	                        </a>
                        <% }%>
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
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header justify-content-center">
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body justify-content-between" style="margin-left:20%; margin-right:20%;">
                    
                    <style>
                        .dropdown_icon {
                            margin-bottom: 5px;
                        }

                        .dropdown-menu {
                            font-size: 20px;
                        }
                        .nav-item {
                            padding-left: 10px;
                            font-size: 20px;
                        }
                    </style>
                    <ul class="navbar-nav menu-list list-unstyled d-flex gap-md-3 mb-0">
                                <!-- 메뉴 항목 -->
                                <li class="nav-item">
                                    <a href="/user/userMyPage" class="nav-link">프로필</a>
                                </li>
                                <li class="nav-item">
                                    <a href="/user/userInfoChange" class="nav-link">회원정보수정</a>
                                </li>
                                <li class="nav-item">
                                    <a href="/user/userLeave" class="nav-link">회원탈퇴</a>
                                </li>
                                <li class="nav-item">
                                    <a href="/user/MyboardQboard" class="nav-link">내 게시글</a>
                                </li>
                                <li class="nav-item">
                                    <a href="/user/MylikeQboard" class="nav-link">좋아요</a>
                                </li>
                                <li class="nav-item">
                                    <a href="/user/myFlashmob" class="nav-link">내 모임</a>
                                </li>
                                <li class="nav-item">
                                    <a href="/myInquiryboard/list" class="nav-link">내 문의내역</a>
                                </li>
                     </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
<style>
	.container_div{
		width: 1300px;
        margin:0 auto;	
	}
	
	.profile_div{
		width:400px;
		height:600px;
		border-radius:10px;
		border:1px solid gray;
		float:left;
	}
	.profile_img{
		width:200px;
		border-radius:50%;
		margin-left:24%;
		margin-right:20%;
		margin-top:15%;
	}
	.profile_info{
		margin-top:10px;
		text-align:center;
		font-size:20px;
	}
	  .profile_info > div {
    margin-bottom: 15px; /* 각 div 사이의 세로 간격 조절 */
  }

  .profile_info button {
    margin-top: 10px; /* 버튼과 상위 요소 간의 간격 조절 */
  }
  	.profile_setting {
	    background-color: white;
	    font-size: 20px;
	    cursor: pointer;
	    width: 120px;
	    height: 50px;
	    align-items: center;
	    justify-content: center;
	    font-weight: lighter;
	    border: 1px solid gray;
	    border-radius:10px;
	}
	
	.profile_setting:hover {
	    box-shadow: 0px 0px 5px 0px gray; /* 그림자 효과 추가 */
	}
	.myflashmob_div{
		display:flex;
		padding-left:5%;
	}
	.add_button{
		float:right;
		background-color:white;
		border-style:none;
		padding-top:30px;
		font-size:25px;
	}
</style>
<script>
	const myflashmob = function(){
		window.location.href = '';
	}
	
	const profile_setting = function(){
		window.location.href = '/user/profileSetting';
	}
</script>

<section style="margin-top:280px;">
	<div class="container_div">
		<div class="profile_div">
			<div><img class="profile_img" src="../../resources/images/profile_image.png"></div>
			<div class="profile_info">
				<div style="font-size:30px;"><%= user.getUser_nick() %></div>
				<div>게시글 10 | 댓글 20 | 좋아요 5</div>
				<div style="text-decoration:underline; text-underline-offset: 0.2em;">
											    <%!
								        String formatInquiryText(String text) {
								            if (text == null) {
								                return "간단한 자기소개를 입력해주세요.";
								            }
								            return text.replace("\n", "<br>");
								        }
								    %>
								    
				<%= formatInquiryText(user.getProfile_text())%>
				</div>
				<button class="profile_setting" onclick="profile_setting();">프로필 설정</button>
			</div>
		</div>
		<div class="myflashmob_div">
			<div>
				<div><span style="font-size:40px;">내 모임</span><button class="add_button" onclick="myflashmob();">더 보기</button></div>
				<hr style="width:840px;">
			</div>
			<div>
			
			</div>
		</div>
	</div>
</section>

</body>
</html>
