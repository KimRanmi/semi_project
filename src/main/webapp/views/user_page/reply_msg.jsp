<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<link href="../../resources/css/list.css" rel="stylesheet" type="text/css">
	<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="../../resources/css/paging.css" rel="stylesheet" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </head>

    <body>

<style>
	.received_msg{
	background-color: #4c9cf7;
      color: white;
      border: none;
      font-size: 20px;
      cursor: pointer;
      width: 120px;
      height: 60px;
      align-items: center;
      justify-content: center;
      font-weight:lighter;
      border:1px solid white;
	}
	
	.received_msg:hover {
    background-color: #1d8cf8; /* 마우스 호버 시 색상 변화 */
	}	
	
	.sent_msg {
	    background-color: #4c9cf7; /* 진한 파란색으로 변경 */
	    color: white;
	    border: none;
	    font-size: 20px;
	    cursor: pointer;
	    width: 120px;
	    height: 60px;
	    align-items: center;
	    justify-content: center;
	    font-weight: lighter;
	    border: 1px solid white;
	}
	
	.sent_msg:hover {
	    background-color: #1d8cf8; /* 마우스 호버 시 색상 변화 */
	}
	
	.write_msg{
	background-color: #0d6efd;
      color: white;
      border: none;
      font-size: 20px;
      cursor: pointer;
      width: 120px;
      height: 60px;
      align-items: center;
      justify-content: center;
      font-weight:lighter;
      border:1px solid white;
	}
	
	.write_msg:hover {
    background-color: #0a58ca; /* 마우스 호버 시 색상 변화 */
	}

    .send_button {
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
    }

    .send_button:hover{
      background-color: #0a58ca;
    }
    .cancel_button{
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
      margin-left:20px;
    }

    .cancel_button:hover{
      background-color: gray;
    }
    
    .input{
    	margin-left:50px;
    	border-radius:10px;
    	padding:10px 15px;
    	width:800px;
    	font-size:20px;
    	height: 40px;
    }
    
    .label{
    	font-size:20px;
    	padding-top:3px;
    }
    .form-divider {
        margin-top: 20px; /* 선과 폼 사이의 간격 조정 */
        border: none;
        border-top: 2px solid gray; /* 선 스타일 설정 */
    }
            #msg_title {
        border-radius: 10px;
		width:800px;
        font-size: 20px;
        padding:15px 20px;
        font-weight: bolder;
        box-sizing: border-box; /* 내부 패딩과 경계선 포함 */
        resize: none; /* 사용자가 크기 조정 못하게 */
        margin-left:90px;
    }
        #msg_text {
        border-radius: 10px;
		width:800px;
        font-size: 20px;
        padding:15px 20px;
        font-weight: bolder;
        box-sizing: border-box; /* 내부 패딩과 경계선 포함 */
        resize: none; /* 사용자가 크기 조정 못하게 */
        margin-left:90px;
    }
      .text_count_div{
        float: right;
        margin-right: 230px; /* 텍스트 카운트와 버튼 간격 조정 */
        margin-top: 20px;
        display: flex;
        font-size: 16px;
    }
    .button_div{
        display: flex;
        float: right;
        margin-top: 70px; /* 버튼과 다른 요소 간격 조정 */
        margin-right: -97px; /* 버튼 우측 여백 조정 */
    }
	</style>

	<script>
		const received_page = function(){
			window.location.href = '/receivedMsg/list';
		}
		const sent_page = function(){
			window.location.href = '/sentMsg/list';
		}	
		const write_page = function(){
			window.location.href = '/user/msgForm';
		}
		$(function() {
		    $('#msg_text').on('keyup', function() {
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

			function writeMsgForm(event) {
			   let form = document.msgFrm;
			   if (!form.receiver_nick.value) {
			        alert("받는 사람 닉네임을 입력하세요.");
			        form.receiver_nick.focus();
			   }else if (!form.msg_title.value) {
				     alert("제목을 입력하세요.");
				     form.msg_title.focus();
			    } else if (!form.msg_text.value) {
			        alert("내용을 입력하세요.");
			        form.msg_text.focus();
			    } else {
			    	form.submit();
			    	alert("쪽지 전송이 완료되었습니다.");
			    }
			}
	</script>
							<% 
							    String senderNick = (String)request.getAttribute("senderNick");
							 %>
<%@ include file ="../include/new_header.jsp" %>
    <section style="margin-bottom:550px;">
    <%@page import="com.cm.user_page.vo.Message, java.util.*" %>
		<div id="section_wrap">
			<div>
				<button class="received_msg" type="button" style="float:left" onclick="received_page();">받은 쪽지함</button>
				<button class="sent_msg" type="button" style="float:left" onclick="sent_page();">보낸 쪽지함</button>
				<button class="write_msg" type="button" style="float:left" onclick="write_page();">쪽지 보내기</button>
			</div>
			<br><br><br>
			<div class="word">
				<span style="font-size: 40px; float:left;">쪽지 보내기</span>
				<br><br>
			</div>
			<div style="text-align: center;">
				<hr class="form-divider">
				<form method="post" name="msgFrm" action="/user/msgFormEnd" style="clear:both; position:relative">
					<div style="float:left; margin-left:150px; margin-top:20px; display:flex;">
						<label for="receiver_nick" class="label">받는 사람</label>
						<input type="text" id="receiver_nick" name="receiver_nick" class="input" value="<%=senderNick%>" placeholder="받는 사람 아이디를 입력하세요.">
					</div>
					<div style="float:left; margin-left:150px; margin-top:20px; display:flex; font-weight: lighter">
						<label for="msg_title" class="label">제목</label>
						<input type="text" id="msg_title" name="msg_title" class="input">
					</div>
					<div style="float:left; margin-left:150px; margin-top:20px; display:flex;">
						<label for="msg_text" class="label">내용</label>
						<textarea id="msg_text" name="msg_text" cols="71" rows="5" maxlength="500" style="font-weight: lighter;"></textarea>
					</div>
						<div class="text_count_div" style="float:right;"><span id="text_count">0</span><span>/최대 500자</span>
            			</div>
					<div class="button_div">
				      <button class="send_button" type="button" onclick="writeMsgForm(event);">보내기</button>
				      <button class="cancel_button" type="reset" onclick="window.history.back()">취소</button>
				    </div>
				</form>
			</div>
			</div>
		</div>
	</section>

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