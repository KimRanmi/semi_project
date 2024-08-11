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
	<link href="../../resources/css/list.css" rel="stylesheet" type="text/css">
	<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="../../resources/css/paging.css" rel="stylesheet" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    </head>

    <body>
<style>
	.table_text{
		height:50px;
	}
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
	    background-color: #0d6efd; /* 진한 파란색으로 변경 */
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
	    background-color: #0a58ca; /* 마우스 호버 시 색상 변화 */
	}
	
	.write_msg{
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
	
	.write_msg:hover {
    background-color: #1d8cf8; /* 마우스 호버 시 색상 변화 */
	}
	
		.answer_button{
	background-color: #0d6efd;
      color: white;
      border: none;
      font-size: 20px;
      cursor: pointer;
      width: 100px;
      height: 50px;
      align-items: center;
      justify-content: center;
      font-weight:lighter;
	}
	.delete_button{
	background-color: #b6b6b6cb;
      color: white;
      border: none;
      font-size: 20px;
      cursor: pointer;
      width: 100px;
      height: 50px;
      align-items: center;
      justify-content: center;
      font-weight:lighter;
	}
	
		.delete_button:hover{
		background-color: gray;
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
	
	const delete_page = function(messageNo){
		window.location.href = '/user/deleteSentMsg?messageNo=' + messageNo;
	}
	$(document).ready(function() {
		// 전체 선택 체크박스 클릭 시 모든 체크박스 선택/해제
        var selectAllCheckbox = document.getElementById('selectAllCheckbox');
        selectAllCheckbox.addEventListener('change', function() {
            var checkboxes = document.getElementsByClassName('messageCheckbox');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = this.checked;
            }
        });

        // 선택된 체크박스 삭제 함수
        $("#deleteSelectedButton").on("click", function() {
	        var messageNos = [];
	        $(".messageCheckbox:checked").each(function() {
	        	messageNos.push($(this).val());
	        });
	        
	        if (messageNos.length === 0) {
	            alert('삭제할 메시지가 선택되지 않았습니다.');
	            return; // 함수 종료
	        }
	        
	        var sendData = JSON.stringify(messageNos);
	
	        $.ajax({
	            url: '/user/deleteSentMsg',  // 삭제 처리를 담당하는 서블릿 URL
	            type: 'POST',
	            data: { messageNos: sendData },  // 선택된 메시지 번호들을 서버로 전송
	            success: function(response) {
	            	window.location.reload();
	            },
	            error: function(xhr, status, error) {
	                alert('삭제 중 오류가 발생했습니다.');
	            }
	        });
	            	alert("성공적으로 삭제되었습니다.")
	    });
        
        // 토글 아이콘 클릭 시 답변 토글
        const toggleIcons = document.querySelectorAll('.toggle_icon');
        toggleIcons.forEach(toggleIcon => {
            toggleIcon.addEventListener('click', () => {
                // 현재 클릭된 토글 아이콘의 부모 요소인 질문을 찾음
                const question = toggleIcon.closest('.question');
                if (!question) return;

                // 질문 옆의 답변 요소를 찾아서 toggle
                const answer = question.nextElementSibling;
                if (answer) {
                    answer.classList.toggle('visible');
                }

                // 토글 아이콘 회전 클래스 추가/제거
                toggleIcon.classList.toggle('rotate');
            });
        });
    });
</script>
<%@ include file ="../include/new_header.jsp" %>
    <section>
		<div id="section_wrap">
			<div>
				<button class="received_msg" type="button" style="float:left" onclick="received_page();">받은 쪽지함</button>
				<button class="sent_msg" type="button" style="float:left" onclick="sent_page();">보낸 쪽지함</button>
				<button class="write_msg" type="button" style="float:left" onclick="write_page();">쪽지 보내기</button>
			</div>
			<br><br><br>
			<div class="word">
				<span style="font-size: 40px; float:left;">보낸 쪽지함
				<button id="deleteSelectedButton" type="button" style="border-style:none; background-color:white;">
				    <iconify-icon style="cursor: pointer;" icon="jam:trash" width="32" height="32"></iconify-icon>
				</button>
				</span>
			</div><br><br>
			<div class="book_list">
				<table>
					<colgroup>
						<col width="5%">
						<col width="5%">
						<col width="15%">
						<col width="55%">
                        <col width="20%">
					</colgroup>
					<thead>
						<tr>
							<th class="table_text"><input type="checkbox" id="selectAllCheckbox"></th>
							<th class="table_text">No</th>
							<th class="table_text">받는 사람</th>
							<th class="table_text">제목</th>
                            <th class="table_text">보낸날짜</th>
						</tr>
					</thead>
					<tbody>
						<%@page import="com.cm.user_page.vo.Message,java.util.*" %>
						<%@page import="java.time.LocalDateTime,java.time.format.DateTimeFormatter" %>
							<%
							List<Message> list = (List<Message>) request.getAttribute("resultList");
							DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
																	    
							for (int i = 0; i < list.size(); i++) {
							%>
							    <tr class="question">
							    	<td class="table_text"><input type="checkbox" class="messageCheckbox" value="<%= list.get(i).getMessage_no() %>"></td>
							        <td class="table_text"><%= list.size()-i %></td>
							        <td class="table_text"><%=list.get(i).getUser_nick()%>(<%=list.get(i).getUser_id()%>)</td>
							        <td class="table_text"><%=list.get(i).getMsg_title()%><img src="../../resources/images/토글.png" style="margin-top:-5px;" class="toggle_icon"></td>
							        <td class="table_text"><%=dtf.format(list.get(i).getMsg_reg_date())%></td>
							    </tr>
							    <tr class="answer">
							        <td class="table_text" colspan="3"></td>
							        <td class="table_text" style="text-align: center;">
								        <div style="padding: 8px">
								        	<%= formatInquiryText(list.get(i).getMsg_text()) %>
								        </div>
							        </td>
							        <td class="table_text"></td>
							    </tr>
										    <%!
								        String formatInquiryText(String text) {
								            if (text == null) {
								                return "";
								            }
								            return text.replace("\n", "<br>");
								        }
								    %>
							   <%}%>
						</tbody>
				</table>
			</div>
		</div>
	</section>
	
	<%Message paging = (Message)request.getAttribute("paging");%>
	<% if(paging != null){ %>
		<div class="center" style="margin-top:100px;">
			<div class="pagination">
				<% if(paging.isPrev()){ %>
					<a href="/sentMsg/list?nowPage=<%=(paging.getPageBarStart()-1)%>">
						&laquo;
					</a>
				<%} %>
				<% for(int i=paging.getPageBarStart(); i<=paging.getPageBarEnd(); i++){ %>
					<a href="/sentMsg/list?nowPage=<%=i%>"
					<%=paging.getNowPage() == i ? "class='active'" : "" %>>
						<%=i %>
					</a>
				<% }%>
				<% if(paging.isNext()){%>
					<a href="/sentMsg/list?nowPage=<%=(paging.getPageBarEnd()+1)%>">&raquo;</a>
				<%}%>
			</div>
		</div>
		<%}%>

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