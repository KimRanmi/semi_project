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
<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
</head>

<body>
  <style>
    .customer_section {
        font-family: "Jua", sans-serif;
        margin-left: 30%;
        margin-right: 30%;
        margin-top: 15%;
    }
    .title {
        font-size: 30px;
    }
    .title_icon {
        margin-right: 15px;
        margin-bottom: -5px;
    }
    .question {
        display: flex;
        align-items: center;
        margin: 0;
        border: none;
        background: none;
        font: inherit;
        color: rgb(47, 52, 56);
        width: 100%;
        position: relative;
        text-align: left;
        padding: 10px 40px 10px 36px;
        cursor: pointer; /* 질문 클릭 가능하도록 설정 */
    }
    .text_icon {
        width: 20px;
        height: 20px;
        margin-right: 5px;
    }
    .toggle_icon {
        margin-left: auto; /* 토글 아이콘을 오른쪽으로 정렬 */
    }
    .answer {
        display: none; /* 답변 숨기기 */
        margin-left: 60px; /* 답변을 질문과 들여쓰기로 구분 */
        padding: 10px 0;
        background-color: rgba(209, 209, 209, 0.705);
        border-radius: 10px;
    }
    hr {
        margin: 10px 0; /* 수평 구분선 간격 설정 */
        border: none;
        border-top: 1px solid rgb(200, 200, 200); /* 회색 선 추가 */
    }
    .answer_text{
        margin-left: 20px;
        line-height: 30px;
    }
    .contact-button {
        display: flex;
        background-color: #4c9cf7cb;
        color: white;
        border: none;
        font-size: 20px;
        cursor: pointer;
        border-radius: 10px;
        width: 150px;
        height: 50px;
        align-items: center;
        justify-content: center;
        right: 535px;
        margin-top: 10px;
        margin-left: 30px;
    }
    .contact-button:hover {
        background-color: #4c9cf7;
    }
    .customer{
        display: flex;
    }

    .customer_title{
        font-size: 40px;
    }
</style>
<script>
function checkUserSession() {
    // 세션 체크 및 리다이렉션
    if (<%= session.getAttribute("user") == null %>) {
        window.location.href = '/user/login';
    } else {
        window.location.href = '/admin/inquiryForm';
    }
}
</script>

<%@ include file ="../include/new_header.jsp" %>
<section class="customer_section">
  <div class="customer">
      <div class="customer_title">고객센터</div>
      <button class="contact-button" onclick="checkUserSession()">1:1 문의하기</button>
  </div>
  <div class="QandA">
      <div class="title">
          <span><img src="../../resources/images/Q&A.png" class="title_icon"></span>
          <span>자주 묻는 질문</span>
      </div>
      <hr>
      <!-- 첫 번째 질문 -->
      <button class="question">
          <img src="../../resources/images/letter-q.png" class="text_icon">
          <span class="question_text">회원정보는 어떻게 수정하나요?</span>
          <img src="../../resources/images/토글.png" class="toggle_icon">
      </button>
      <div class="answer">
          <div class="answer_text">마이페이지 - 회원정보수정</div>
      </div>
      <hr>
      <!-- 두 번째 질문 -->
      <button class="question">
          <img src="../../resources/images/letter-q.png" class="text_icon">
          <span class="question_text">좋아요를 누른 글은 어디서 볼 수 있나요?</span>
          <img src="../../resources/images/토글.png" class="toggle_icon">
      </button>
      <div class="answer">
          <div class="answer_text">마이페이지 - 좋아요</div>
      </div>
      <hr>
      <!-- 세 번째 질문 -->
      <button class="question">
          <img src="../../resources/images/letter-q.png" class="text_icon">
          <span class="question_text">회원탈퇴는 어떻게 하나요?</span>
          <img src="../../resources/images/토글.png" class="toggle_icon">
      </button>
      <div class="answer">
          <div class="answer_text">마이페이지 - 회원탈퇴</div>
      </div>
      <hr>
      <!-- 네 번째 질문 -->
      <button class="question">
          <img src="../../resources/images/letter-q.png" class="text_icon">
          <span class="question_text">인기글이 되는 기준은 무엇인가요?</span>
          <img src="../../resources/images/토글.png" class="toggle_icon">
      </button>
      <div class="answer">
          <div class="answer_text">인기글 순위는 좋아요가 많은 순입니다.</div>
      </div>
      <hr>
      <!-- 다섯 번째 질문 -->
      <button class="question">
          <img src="../../resources/images/letter-q.png" class="text_icon">
          <span class="question_text">번개모임 게시판에 대해서 자세히 알고 싶어요.</span>
          <img src="../../resources/images/토글.png" class="toggle_icon">
      </button>
      <div class="answer">
          <div class="answer_text">갑자기 계획없이 만나는 모임을 '번개모임'이라고 합니다. <br>번개모임 게시판에서 일정, 날짜, 인원 수를 설정하여 글을 올릴 수 있습니다.</div>
      </div>
      <hr>
  </div>
</section>
<script>
  // 질문 버튼 클릭 시 답변 토글
  const questions = document.querySelectorAll('.question');
  
  questions.forEach(question => {
      question.addEventListener('click', () => {
          // 현재 클릭된 질문의 다음 요소 sibling을 찾아서 toggle
          const answer = question.nextElementSibling;
          if (answer.style.display === 'block') {
              answer.style.display = 'none';
          } else {
              answer.style.display = 'block';
          }
      });
  });
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