<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>문의내역</title>
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
	<link href="../../resources/css/admin_list.css" rel="stylesheet" type="text/css">
	<link href="../../resources/css/style.css" rel="stylesheet" type="text/css">
	<link href="../../resources/css/paging.css" rel="stylesheet" type="text/css">
    </head>

    <body>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        // 질문 클릭 시 답변 토글
        const questions = document.querySelectorAll('.question');

        questions.forEach(question => {
            question.addEventListener('click', () => {
            	 // 현재 클릭된 질문의 다음 행을 찾아서 toggle
                const answerRow = question.parentElement.nextElementSibling;

                // 답변 행의 display 상태 toggle
                if (answerRow.classList.contains('answer')) {
                    answerRow.classList.toggle('visible');
                }

                // 토글 아이콘 회전 클래스 추가/제거 (선택사항)
                const toggleIcon = question.querySelector('.toggle_icon');
                toggleIcon.classList.toggle('rotate');
            });
        });
    });
    const answer_page = function(inquiryNo){
    	window.location.href = '/admin/replyForm?inquiryNo=' + inquiryNo;
    }
    
</script>
<style>
	.answer_no_button{
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
	
		.answer_yes_button{
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
	
	.answer_yes_button:hover{
		background-color: gray;
	}
</style>
 <%@ include file ="../include/new_header.jsp" %>
    <section>
		<div id="section_wrap">
			<div class="word">
				<span style="font-size: 40px;">문의내역</span>
			</div><br>
			<div class="book_list">
				<table>
					<colgroup>
						<col width="10%">
						<col width="10%">
						<col width="40%">
                        <col width="15%">
                        <col width="15%">
                        <col width="10%">
					</colgroup>
					<thead>
						<tr>
							<th class="table_text">번호</th>
							<th class="table_text">회원번호</th>
							<th class="table_text">제목</th>
                            <th class="table_text">작성날짜</th>
                            <th class="table_text">수정날짜</th>
                            <th class="table_text">답변여부</th>
						</tr>
					</thead>
					<tbody>
						<%@page import="com.cm.admin_page.vo.Inquiry, java.util.*" %>
						<%@page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
							<% 
							    List<Inquiry> list = (List<Inquiry>) request.getAttribute("resultList");
							    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
							    
							    for (int i = 0; i < list.size(); i++) {
							        // 질문 출력
							        String replyStatus = list.get(i).getReply_status();
							    %>
							    <tr>
							        <td class="table_text"><%= list.get(i).getInquiry_no() %></td>
							        <td class="table_text"><%= list.get(i).getUser_no() %></td>
							        <td class="table_text question"><%= list.get(i).getInquiry_title() %><img src="../../resources/images/토글.png" class="toggle_icon"></td>
							        <td class="table_text"><%= dtf.format(list.get(i).getInquiry_reg_date()) %></td>
							        <td class="table_text"><%= dtf.format(list.get(i).getInquiry_mod_date()) %></td>
							    	<td class="table_text">
							    		        <% if (replyStatus.equals("REPLIED")) { %>
										       
										 			<button class="answer_yes_button" type="button" disabled>답변작성</button>
										        <% } else { %>
										 
										            <button class="answer_no_button" type="button" onclick="answer_page(<%= list.get(i).getInquiry_no() %>);">답변작성</button>
										        <% } %>
							    	</td>
							    </tr>
								<tr class="answer">
							        <td class="table_text" colspan="2"></td>
							        <td class="table_text" style="text-align:left;">
								        <div  style="padding: 15px;">
								        	<%= formatInquiryText(list.get(i).getInquiry_text()) %>
								        </div>
							        </td>
							        <td class="table_text" colspan="3"></td>
							    </tr>
							    <%!
								        String formatInquiryText(String text) {
								            if (text == null) {
								                return "";
								            }
								            return text.replace("\n", "<br>");
								        }
								    %>
							   <%} %>
						</tbody>
				</table>
			</div>
		</div>
	</section>
	
	<% Inquiry paging = (Inquiry)request.getAttribute("paging"); %>
	<% if(paging != null){ %>
		<div class="center" style="margin-top:100px;">
			<div class="pagination">
				<% if(paging.isPrev()){ %>
					<a href="/inquiryBoard/list?nowPage=<%=(paging.getPageBarStart()-1)%>">
						&laquo;
					</a>
				<%} %>
				<% for(int i=paging.getPageBarStart(); i<=paging.getPageBarEnd(); i++){ %>
					<a href="/inquiryBoard/list?nowPage=<%=i%>"
					<%=paging.getNowPage() == i ? "class='active'" : "" %>>
						<%=i %>
					</a>
				<% }%>
				<% if(paging.isNext()){%>
					<a href="/inquiryBoard/list?nowPage=<%=(paging.getPageBarEnd()+1)%>">&raquo;</a>
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