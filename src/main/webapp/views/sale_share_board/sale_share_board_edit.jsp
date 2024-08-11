<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
    <link rel="stylesheet" type="text/css" href="../../resources/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/normalize.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/paging.css">
        <link rel="stylesheet" type="text/css" href="../../resources/css/createSale.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <%@ include file="../include/new_header.jsp" %>
    <!-- <img src='../../resources/img/free-icon-sale-7967061.png' id="sale_icon">판매나눔 -->
    <%@ page import ="com.cm.sale_share_board.vo.SaleShareList, java.util.*" %>
        <%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
        <%@ page import="java.time.Duration, java.time.format.DateTimeFormatter" %>
        <% SaleShareList list = (SaleShareList)request.getAttribute("list");%>
    <section id="section_id">
        
        <form action="/sale_share_board/sale_share_board_edit_end" method="post" enctype="multipart/form-data" id="form_id" name="form_id">
            <input type="hidden" name="postNo" value="${postNo}">
            
            <div class="form_group">
                <div class="form_group">
                <img src="../../upload/<%= list.getImage_new_name() %>" width="200px" height="200px">
                <input type='file' id="myFile" name="thumbnail"><br><br>    
            	</div>
            </div>
            <div class="form_group">
                <label for="prod_id">상품명</label>
                <input type="text" id="prod_id" name="post_title" placeholder="상품명" value="<%= list.getPost_title() %>">
                <span id="span_leng">0/20</span>
                <span id="error_message">20자리까지 작성 가능합니다.</span><br><br>
                
                <label for="price_id">가격</label>
                <input type="number" id="price_id" name="prod_price" value="<%= list.getProd_price() %>">
                
                <label>나눔</label>
                <input type="checkbox" id="free_checkBox"><br><br>
                
                <label for="place">거래장소</label>
                <input type="text" id="place" name="place" value="서울시 <%= list.getLocal_gu_name() %>"><br><br>
                
                <%= list.getProd_cate() %>
                <label>카테고리</label>
                <select name="prod_cate" id="prod_cate">
                    <option value="0" >------------------</option>
                    <option value="1" <%= list.getProd_cate() == 1 ? "selected=\"selected\"" : "" %>>가구</option>
                    <option value="2" <%= list.getProd_cate() == 2 ? "selected=\"selected\"" : "" %>>식품</option>
                    <option value="3" <%= list.getProd_cate() == 3 ? "selected=\"selected\"" : "" %>>가전</option>
                    <option value="4" <%= list.getProd_cate() == 4 ? "selected=\"selected\"" : "" %>>의류</option>
                    <option value="5" <%= list.getProd_cate() == 5 ? "selected=\"selected\"" : "" %>>기타</option>
                </select><br><br>
                
                <label>거래상태</label>
                <select name="deal_status">
                    <option value="0">거래중</option>
                    <option value="1">예약중</option>
                    <option value="2">예약완료</option>
                </select>
            </div>
            
            <div class="form_group">
                <div class="textarea-container">
                    <label for="description">설명</label>
                    <textarea placeholder="자세한 설명 글 올리기" id="description" name="post_text"><%= list.getPost_text() %></textarea>
                </div>
            </div>
            
            <input type="checkbox" id="close" name="closed" value="Y">
            <label for="closed">비공개</label><br><br>
            
            <input type="submit" value="올리기" id="submit_id" onclick="createBoardForm();">
            <input type="button" value="목록" onclick="window.history.back();">
        </form>
    </section>

    <script type="text/javascript">
        window.onload = function() {
            document.getElementById("place").addEventListener("click", function() {
                new daum.Postcode({
                    oncomplete: function(data) {
                        if(data.sido === "서울"){
                            var si = data.sido; // 시 정보
                            var gu = data.sigungu; // 구 정보
                            var sigu = si + " " + gu;
                            document.getElementById("place").value = sigu;
                        } else {
                            alert("서울시 주소만 입력 가능합니다.");
                        }
                    }
                }).open();
            });

            // 상품명 입력 필드의 문자 길이 검사
            document.getElementById("prod_id").addEventListener("keyup", function() {
                var text_leng = this.value;
                var span_leng = document.getElementById("span_leng");
                var error_message = document.getElementById("error_message");
                span_leng.textContent = text_leng.length + '/20';
                if (text_leng.length > 20) {
                    error_message.textContent = '20자리가 넘습니다.';
                    error_message.style.color = 'red';
                } else {
                    error_message.textContent = '';
                    error_message.style.color = '';
                }
            });

            // 가격 입력 필드 처리
            document.getElementById("price_id").addEventListener("keyup", function() {
                var text_price = this.value;
                var free_checkBox = document.getElementById("free_checkBox");
                if (text_price == 0) {
                    free_checkBox.checked = true;
                } else {
                    free_checkBox.checked = false;
                }
            });

            // 파일 입력 필드 처리
            document.getElementById("myFile").addEventListener("change", function() {
                readURL(this);
            });

            // 폼 검증 및 제출
            document.getElementById("submit_id").addEventListener("click", function(event) {
                event.preventDefault();
                createBoardForm();
            });

            // 파일 URL 읽기 함수
            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function(e) {
                        // 이미지 미리보기 처리 등 추가 가능
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }

            function createBoardForm() {
                var form = document.getElementById("form_id");
                if (!form.post_title.value) {
                    alert("제목을 입력하세요.");
                    form.post_title.focus();
                } else if (!form.post_text.value) {
                    alert("내용을 입력하세요.");
                    form.post_text.focus();
                } else if (!form.thumbnail.value) {
                    alert('이미지 파일을 선택하세요.');
                    form.thumbnail.focus();
                } else if (!form.prod_price.value) {
                    alert('금액을 입력해주세요');
                    form.prod_price.focus();
                } else if (form.prod_cate.value == 0) {
                    alert('카테고리를 선택해주세요');
                    form.prod_cate.focus();
                } else if (form.thumbnail.value) {
                    var val = form.thumbnail.value;
                    var idx = val.lastIndexOf('.');
                    var type = val.substring(idx + 1, val.length);
                    if (type == 'jpg' || type == 'jpeg' || type == 'png') {
                        form.submit();
                    } else {
                        alert('이미지 파일만 선택할 수 있습니다.');
                        form.thumbnail.value = '';
                    }
                } else {
                    form.submit();
                }
            }
        };
    </script>
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
