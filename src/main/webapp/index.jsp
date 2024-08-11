<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Share_Life</title>
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
    <link rel="stylesheet" type="text/css" href="resources/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="resources/css/normalize.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
<meta charset="UTF-8">
</head>
<body>
<%@ include file ="views/include/new_header.jsp" %>

<section id="banner" style="background: #F9F3EC;">
    <div class="container">
        <div class="swiper main-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide py-5">
                    <div class="row banner-content align-items-center">
                        <div class="img-wrapper col-md-5">
                            <img src="resources/images/질문 게시판.png" style="width: 350px; padding-bottom:30px; margin-left:150px;"
                                 class="img-fluid">
                        </div>
                        <div class="content-wrapper col-md-7 p-5 mb-5">
                            <div class="secondary-font text-primary text-uppercase mb-4"></div>
                            <h2 class="banner-title display-1 fw-normal" style="font-size: 50px;">Question Board<br>For <span
                                    class="text-primary">Your Solo Life</span>
                            </h2>
                            <a href="/qboard/list" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1"
                               style="padding-top: 25px; justify-content:center;">
                                <span style="font-size: 20px;">질문 게시판</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide py-5">
                    <div class="row banner-content align-items-center">
                        <div class="img-wrapper col-md-5">
                            <img src="resources/images/판매,나눔 게시판.png" style="width: 350px; padding-bottom:30px; margin-left:150px;"
                                 class="img-fluid">
                        </div>
                        <div class="content-wrapper col-md-7 p-5 mb-5">
                            <div class="secondary-font text-primary text-uppercase mb-4"></div>
                            <h2 class="banner-title display-1 fw-normal" style="font-size: 50px;">Question Board<br>For <span
                                    class="text-primary">Your Solo Life</span>
                            </h2>
                            <a href="/sale_share_board/sale_share_board_list" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1"
                               style="padding-top: 25px; justify-content:center;">
                                <span style="font-size: 20px;">판매/나눔 게시판</span>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="swiper-slide py-5">
                    <div class="row banner-content align-items-center">
                        <div class="img-wrapper col-md-5">
                            <img src="resources/images/번개모임 게시판.png" style="width: 320px; margin-left: 150px; padding-bottom:30px ;"
                                 class="img-fluid">
                        </div>
                        <div class="content-wrapper col-md-7 p-5 mb-5">
                            <div class="secondary-font text-primary text-uppercase mb-4"></div>
                            <h2 class="banner-title display-1 fw-normal" style="font-size: 50px;">Flashmob Board<br>For <span
                                    class="text-primary">Your Solo Life</span>
                            </h2>
                            <a href="/flashmob/list" class="btn btn-outline-dark btn-lg text-uppercase fs-6 rounded-1"
                               style="padding-top: 25px;">
                                <span style="font-size: 20px;">번개모임 게시판</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="swiper-pagination" style="padding-bottom: 10px;">
            	<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>
            </div>
        </div>
    </div>
</section>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var swiper = new Swiper('.swiper', {
            slidesPerView: 'auto',
            spaceBetween: 20,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
    });
</script>

<br>

<div class="swiper-container container my-3 py-5 slider1">
    <h5 style="font-size:40px;" class="display-3 fw-normal">
        <img src="resources/images/fire.png" style="padding-bottom: 12px;">
    인기 게시글 Top7</h5>
    <div class="swiper-wrapper my-5" style="position:relative;">
        <div class="swiper-slide col text-center card">
        	<div class="z-1 position-absolute rounded-3 m-3 px-3 border-dark-subtle" style="left: -20px;">
              <img src="resources/images/1.png">
            </div>
	        <div class="card-body p-0" style="position:absolute; margin-top:230px; display:flex;">
	            <a href="single-product.html">
	               <h3 class="card-title pt-4 m-0" style="font-size: 20px;"><img src="resources/images/profile.png" width="35px" style="margin-bottom: 8px; margin-left:15px;"><span style="margin-left: 8px;">작성자1님</span></h3>
	            </a>
		        <div class="card-text" style="z-index:2000;">
		            <div class="" style="display:flex;">
		                <a href="#" class="" style="margin-left:75px; margin-top:32px;">
		                    <iconify-icon icon="fluent:heart-28-filled" class="" style="font-size:20px;"></iconify-icon>
		                </a>
		        	</div>
		     	</div>
	     	</div>
        </div>
        <div class="swiper-slide col text-center card">
        	<div class="z-1 position-absolute rounded-3 m-3 px-3 border-dark-subtle" style="left: -20px;">
              <img src="resources/images/2.png">
            </div>
	        <div class="card-body p-0" style="position:absolute; margin-top:230px; display:flex;">
	            <a href="single-product.html">
	               <h3 class="card-title pt-4 m-0" style="font-size: 20px;"><img src="resources/images/profile.png" width="35px" style="margin-bottom: 8px; margin-left:15px;"><span style="margin-left: 8px;">작성자1님</span></h3>
	            </a>
		        <div class="card-text" style="z-index:2000;">
		            <div class="" style="display:flex;">
		                <a href="#" class="" style="margin-left:75px; margin-top:32px;">
		                    <iconify-icon icon="fluent:heart-28-filled" class="" style="font-size:20px;"></iconify-icon>
		                </a>
		        	</div>
		     	</div>
	     	</div>
        </div>
        <div class="swiper-slide col text-center card">
        	<div class="z-1 position-absolute rounded-3 m-3 px-3 border-dark-subtle" style="left: -20px;">
              <img src="resources/images/3.png">
            </div>
	        <div class="card-body p-0" style="position:absolute; margin-top:230px; display:flex;">
	            <a href="single-product.html">
	               <h3 class="card-title pt-4 m-0" style="font-size: 20px;"><img src="resources/images/profile.png" width="35px" style="margin-bottom: 8px; margin-left:15px;"><span style="margin-left: 8px;">작성자1님</span></h3>
	            </a>
		        <div class="card-text" style="z-index:2000;">
		            <div class="" style="display:flex;">
		                <a href="#" class="" style="margin-left:75px; margin-top:32px;">
		                    <iconify-icon icon="fluent:heart-28-filled" class="" style="font-size:20px;"></iconify-icon>
		                </a>
		        	</div>
		     	</div>
	     	</div>
        </div>
        <div class="swiper-slide col text-center card">
        	<div class="z-1 position-absolute rounded-3 m-3 px-3 border-dark-subtle" style="left: -20px;">
              <img src="resources/images/4.png">
            </div>
	        <div class="card-body p-0" style="position:absolute; margin-top:230px; display:flex;">
	            <a href="single-product.html">
	               <h3 class="card-title pt-4 m-0" style="font-size: 20px;"><img src="resources/images/profile.png" width="35px" style="margin-bottom: 8px; margin-left:15px;"><span style="margin-left: 8px;">작성자1님</span></h3>
	            </a>
		        <div class="card-text" style="z-index:2000;">
		            <div class="" style="display:flex;">
		                <a href="#" class="" style="margin-left:75px; margin-top:32px;">
		                    <iconify-icon icon="fluent:heart-28-filled" class="" style="font-size:20px;"></iconify-icon>
		                </a>
		        	</div>
		     	</div>
	     	</div>
        </div>
        <div class="swiper-slide col text-center card">
        	<div class="z-1 position-absolute rounded-3 m-3 px-3 border-dark-subtle" style="left: -20px;">
              <img src="resources/images/5.png">
            </div>
	        <div class="card-body p-0" style="position:absolute; margin-top:230px; display:flex;">
	            <a href="single-product.html">
	               <h3 class="card-title pt-4 m-0" style="font-size: 20px;"><img src="resources/images/profile.png" width="35px" style="margin-bottom: 8px; margin-left:15px;"><span style="margin-left: 8px;">작성자1님</span></h3>
	            </a>
		        <div class="card-text" style="z-index:2000;">
		            <div class="" style="display:flex;">
		                <a href="#" class="" style="margin-left:75px; margin-top:32px;">
		                    <iconify-icon icon="fluent:heart-28-filled" class="" style="font-size:20px;"></iconify-icon>
		                </a>
		        	</div>
		     	</div>
	     	</div>
        </div>
        <div class="swiper-slide col text-center card">
        	<div class="z-1 position-absolute rounded-3 m-3 px-3 border-dark-subtle" style="left: -20px;">
              <img src="resources/images/6.png">
            </div>
	        <div class="card-body p-0" style="position:absolute; margin-top:230px; display:flex;">
	            <a href="single-product.html">
	               <h3 class="card-title pt-4 m-0" style="font-size: 20px;"><img src="resources/images/profile.png" width="35px" style="margin-bottom: 8px; margin-left:15px;"><span style="margin-left: 8px;">작성자1님</span></h3>
	            </a>
		        <div class="card-text" style="z-index:2000;">
		            <div class="" style="display:flex;">
		                <a href="#" class="" style="margin-left:75px; margin-top:32px;">
		                    <iconify-icon icon="fluent:heart-28-filled" class="" style="font-size:20px;"></iconify-icon>
		                </a>
		        	</div>
		     	</div>
	     	</div>
        </div>
        <div class="swiper-slide col text-center card">
        	<div class="z-1 position-absolute rounded-3 m-3 px-3 border-dark-subtle" style="left: -20px;">
              <img src="resources/images/7.png">
            </div>
	        <div class="card-body p-0" style="position:absolute; margin-top:230px; display:flex;">
	            <a href="single-product.html">
	               <h3 class="card-title pt-4 m-0" style="font-size: 20px;"><img src="resources/images/profile.png" width="35px" style="margin-bottom: 8px; margin-left:15px;"><span style="margin-left: 8px;">작성자1님</span></h3>
	            </a>
		        <div class="card-text" style="z-index:2000;">
		            <div class="" style="display:flex;">
		                <a href="#" class="" style="margin-left:75px; margin-top:32px;">
		                    <iconify-icon icon="fluent:heart-28-filled" class="" style="font-size:20px;"></iconify-icon>
		                </a>
		        	</div>
		     	</div>
	     	</div>
        </div>
    </div>
    <div class="swiper-button-prev swiper-button-prev1"></div>
    <div class="swiper-button-next swiper-button-next1"></div>
</div>

<%@page import="com.cm.flashmob.vo.Flashmob, java.util.*" %>
<%@page import="com.cm.flashmob.service.FlashmobService, java.util.*"%>
<% List<Flashmob> list = new FlashmobService().popularFlashmob(); %>

<div class="swiper-container container my-3 py-5 slider2">
    <h5 style="font-size:40px;" class="display-3 fw-normal">
        <img src="resources/images/pink_fire.png" style="padding-bottom: 12px;">
        인기 모임 Top7</h5>
    <div class="swiper-wrapper my-5" style="position:relative;">
    	<% for (int i = 0; i <  Math.min(list.size(), 7); i++) {%>
	        <div class="swiper-slide col text-center card" style="border:5px solid #f85c2cbd;">
	        	<div class="z-1 position-absolute rounded-3 m-3 px-3 border-dark-subtle" style="left: -20px;">
	              <img src="resources/images/<%= i + 1 %>.png">
	            </div>
	            <div style="font-size:20px; position: absolute; top: 50%; transform: translateY(-50%); width: 100%; text-align: center; padding-left:30px; padding-right:30px;">
	            	<%=list.get(i).getPost_title() %>
	            </div>
		        <div class="card-body p-0" style="position:absolute; margin-top:230px; display:flex;">
		            <a href="single-product.html">
		               <h3 class="card-title pt-4 m-0" style="font-size: 20px;">
		               	<img src="resources/images/profile.png" width="35px" style="margin-left:10px; margin-top:-10px;">
		               		<span style="margin-bottom:5px;"><%=list.get(i).getUser_nick() %></span>
		               	</h3>
		            </a>
			        <div class="card-text" style="z-index:2000;">
			            <div class="" style="display:flex;">
			                <a href="#" class="" style="margin-left:105px; margin-top:25px;">
			                    <iconify-icon icon="fluent:heart-28-filled" class="" style="font-size:20px;"></iconify-icon>
			                </a>
			        	</div>
			     	</div>
		     	</div>
	        </div>
        <%} %>
    </div>
    <div class="swiper-button-prev swiper-button-prev2"></div>
    <div class="swiper-button-next swiper-button-next2"></div>
</div>

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
<script>
    var swiper1 = new Swiper('.slider1', {
        slidesPerView: 5,
        spaceBetween: 20,
        loop: true,
        navigation: {
            nextEl: '.swiper-button-next1',
            prevEl: '.swiper-button-prev1'
        }
    });
    var swiper2 = new Swiper('.slider2', {
        slidesPerView: 5,
        spaceBetween: 20,
        loop: true,
        navigation: {
            nextEl: '.swiper-button-next2',
            prevEl: '.swiper-button-prev2'
        }
    });
</script>

<footer id="footer" class="my-5">
    <div class="container py-5 my-5">
        <div class="row">
            <div class="col-md-3">
                <div class="footer-menu">
                    <img src="resources/images/집.png" alt="logo">
                    <p class="blog-paragraph fs-6 mt-3">Subscribe to our newsletter to get updates about our grand offers.</p>
                   
                </div>
            </div>
            <div class="col-md-3">
                <div class="footer-menu">
                    <h3>Quick Links</h3>
                    <ul class="menu-list list-unstyled">
                        <li class="menu-item">
                            <a href="index.jsp" class="nav-link">Home</a>
                        </li>
                        <li class="menu-item">
                            <a href="/qboard/list" class="nav-link">질문</a>
                        </li>
                        <li class="menu-item">
                            <a href="/sale_share_board/sale_share_board_list" class="nav-link">판매/나눔</a>
                        </li>
                        <li class="menu-item">
                            <a href="/flashmob/list" class="nav-link">번개모임</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-3">
                <div class="footer-menu">
                    <h3>Help Center</h5>
                        <ul class="menu-list list-unstyled">
                            <li class="menu-item">
                                <a href="/customerCenter" class="nav-link">고객센터</a>
                            </li>
                            <li class="menu-item">
                                <a href="/admin/inquiryForm" class="nav-link">1:1문의하기</a>
                            </li>
                        </ul>
                </div>
            </div>
            <div class="col-md-3">
                <div>
                    <h3>Our Newsletter</h3>
                    <p class="blog-paragraph fs-6">Subscribe to our newsletter to get updates about our grand offers.</p>
                    <div class="search-bar border rounded-pill border-dark-subtle px-2">
                        <form class="text-center d-flex align-items-center" action="" method="">
                            <input type="text" class="form-control border-0 bg-transparent" placeholder="Enter your email here"/>
                            <iconify-icon class="send-icon" icon="tabler:location-filled"></iconify-icon>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<div id="footer-bottom">
    <div class="container">
        <hr class="m-0">
        <div class="row mt-3">
            <div class="col-md-6 copyright">
                <p class="secondary-font">© 2024 cocomong. All rights reserved.</p>
            </div>
            <div class="col-md-6 text-md-end">
                <p class="secondary-font">Free HTML Template by <a href="https://templatesjungle.com/" target="_blank"
                                                                    class="text-decoration-underline fw-bold text-black-50"> TemplatesJungle</a></p>
                <p class="secondary-font">Distributed by <a href="https://themewagon.com/" target="_blank"
                                                             class="text-decoration-underline fw-bold text-black-50"> ThemeWagon</a></p>
            </div>
        </div>
    </div>
</div>

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
