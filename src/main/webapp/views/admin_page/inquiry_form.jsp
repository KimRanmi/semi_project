<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>1:1문의하기</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <meta name="apple-mobile-web-app-capable" content="yes">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
</head>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
  integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="css/vendor.css">
<link rel="stylesheet" type="text/css" href="style.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap"
  rel="stylesheet">
  <script type="text/javascript" src="jquery-3.7.1.js"></script>
<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>

  <style>
    .inquiry_form_section{
        margin-left: 30%;
        margin-right: 30%;
        margin-top: 15%;
        margin-bottom: 200px;
    }
    .form_title {
        font-size: 40px;
        margin-bottom: 20px;
    }
    fieldset {
        border: none;
    }
    #inquiry_title {
        border-radius: 5px;
        border: 1px solid rgba(172, 172, 172, 0.575);
        width: 790px;
        height: 40px;
        font-size: 20px;
        text-indent: 15px;
        font-weight: bolder;
        margin-botton: 10px;
        box-sizing: border-box; /* 내부 패딩과 경계선 포함 */
    }
    #inquiry_text {
        border-radius: 5px;
        border: 1px solid rgba(172, 172, 172, 0.575);
        /* width: 800px;
        height: 500px; */
        font-size: 20px;
        padding:15px 20px;
        font-weight: bolder;
        box-sizing: border-box; /* 내부 패딩과 경계선 포함 */
        resize: none; /* 사용자가 크기 조정 못하게 */
        margin-bottom: 20px;
    }
    .text_count_div{
        float: right;
        margin-right: 10px; /* 텍스트 카운트와 버튼 간격 조정 */
        margin-top: 20px;
        display: flex;
        font-size: 16px;
    }
    .button_div{
        margin-top: 20px; /* 버튼과 다른 요소 간격 조정 */
        display:flex;
        margin-left:450px;
    }
    #warning_message{
      color: rgba(255, 0, 0, 0.582);
      margin-right: 10px;
      visibility: hidden;
    }
    .submit_button {
      position: inline-block;
      display: flex;
      background-color: #0d6efd;
      color: white;
      border: none;
      font-size: 20px;
      cursor: pointer;
      width: 150px;
      height: 50px;
      align-items: center;
      justify-content: center;
      right: 710px;
      margin-top: 20px;
    }

    .submit_button:hover{
      background-color: #0a58ca;
    }
    .cancel_button{
      position: inline-block;
      display: flex;
      background-color: #b6b6b6cb;
      color: white;
      border: none;
      font-size: 20px;
      cursor: pointer;
      width: 150px;
      height: 50px;
      align-items: center;
      justify-content: center;
      right: 535px;
      margin-top: 20px;
      margin-left:10px;
    }

    .cancel_button:hover{
      background-color: gray;
    }
</style>
 <%@ include file ="../include/new_header.jsp" %>
<section class="inquiry_form_section">
    <div class="form_title">1:1 문의하기</div>
    <form method="post" name="inquiryFrm" action="/admin/inquiryFormEnd">
        <fieldset>
        <div style="display: flex;">
        	<label for="inquiry_title" style="width: 100px; font-size: 20px;">문의 제목</label>
            <input type="text" id="inquiry_title" name="inquiry_title" placeholder="문의 제목을 입력하세요." style="font-weight: lighter;">
        </div>
            <br>
        <div style="display: flex;">
        	<label for="inquiry_text" style="width: 100px; font-size: 20px;">문의 내용</label>
            <textarea id="inquiry_text" name="inquiry_text" cols="71" rows="5" placeholder="문의 내용을 입력하세요." maxlength="500" style="font-weight: lighter;"></textarea>
        </div>
        <div class="text_count_div"><span id="text_count">0</span><span>/최대 500자</span>
        </div>
          </fieldset>
    <div class="button_div">
      <button class="submit_button" type="button" onclick="createInquiryForm(event);">등록</button>
      <button class="cancel_button" type="reset" onclick="window.history.back()">취소</button>
    </div>
    </form>
</section>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
    $('#inquiry_text').on('keyup', function() {
        var textLength = $(this).prop('value').length;;
        $('#text_count').text(textLength);
        if (textLength > 500) {
            // 초과한 부분 제거 (최대 500자까지만 입력되도록)
            var trimmedText = $(this).val().substring(0, 500);
            $(this).val(trimmedText);
            // 글자 수 다시 계산
            textLength = trimmedText.length;
            $('#text_count').text(textLength);
        }
    });

});

	function createInquiryForm(event) {
	   let form = document.inquiryFrm;
	   console.log(!form.inquiry_title.value)
	   if (!form.inquiry_title.value) {
	        alert("제목을 입력하세요.");
	        form.inquiry_title.focus();
	    } else if (!form.inquiry_text.value) {
	        alert("내용을 입력하세요.");
	        form.inquiry_text.focus();
	    } else {
	    	form.submit();
	    	alert("문의 등록이 완료되었습니다.");
	    }
	}
</script>


  <footer id="footer" class="my-5">
    <div class="container py-5 my-5">
        <div class="row">
            <div class="col-md-3">
                <div class="footer-menu">
                    <img src="../../resources/images/집.png" alt="logo">
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