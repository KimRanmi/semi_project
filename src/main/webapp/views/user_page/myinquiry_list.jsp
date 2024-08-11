<%@page language="java" contentType="text/html; charset=UTF-8"
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
	<link href="../../resources/css/mylist.css" rel="stylesheet" type="text/css">
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
                // 현재 클릭된 질문의 다음 요소 sibling을 찾아서 toggle
                const answer = question.nextElementSibling;
                const toggleIcon = question.querySelector('.toggle_icon');

                // 답변 요소의 display 상태 toggle
                answer.classList.toggle('visible');

                // 토글 아이콘 회전 클래스 추가/제거
                toggleIcon.classList.toggle('rotate');
            });
        });
    });

    const edit_page = function(inquiryNo){
    	window.location.href = '/user/editMyInquiry?inquiryNo=' + inquiryNo;
    }
    
    const delete_page = function(inquiryNo){
    	window.location.href = '/user/deleteMyInquiry?inquiryNo=' + inquiryNo;
    	alert("성공적으로 삭제되었습니다.");
    }
    
    
    
    
</script>
<style>
	.table_text{
	height:50px;
	}
	.edit_button{
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
		.edit_button:hover {
	    background-color: #0a58ca; /* 마우스 호버 시 색상 변화 */
	}
	.delete_button{
	background-color: #b6b6b6cb;
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
		.delete_button:hover{
		background-color: gray;
	}
	.inquiry_button{
	background-color: #4c9cf7;
      color: white;
      border: none;
      font-size: 20px;
      cursor: pointer;
      width: 140px;
      height: 60px;
      align-items: center;
      justify-content: center;
      font-weight:lighter;
      border:1px solid white;
      float:right;
	}
		.inquiry_button:hover {
    background-color: #1d8cf8; /* 마우스 호버 시 색상 변화 */
	}

</style>
<%@ include file ="userMyPage.jsp" %>
<section>
		<div id="section_wrap">
			<div class="word">
				<span style="font-size: 40px; float:left;">내 문의내역</span>
				<span><button class="inquiry_button" type="button" onclick="window.location.href='/admin/inquiryForm'">1:1문의하기</button></span>
			</div><br>
			<div class="book_list">
				<table>
					<colgroup>
						<col width="10%">
						<col width="60%">
                        <col width="15%">
                        <col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th class="table_text">번호</th>
							<th class="table_text">제목</th>
                            <th class="table_text">작성날짜</th>
                            <th class="table_text">수정날짜</th>
						</tr>
					</thead>
					<tbody>
						<%@page import="com.cm.admin_page.vo.Inquiry, java.util.*" %>
						<%@page import="com.cm.admin_page.vo.Reply, java.util.*" %>
						<%@page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
							<% 
							    List<Inquiry> list = (List<Inquiry>) request.getAttribute("resultList");
								List<Reply> list2 = (List<Reply>) request.getAttribute("resultList2");
							    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
							    
							    for (int i = 0; i < list.size(); i++) {
								    // 답변 상태가 REPLIED일 때 버튼 숨기기
								    boolean hideButtons = "REPLIED".equals(list.get(i).getReply_status());
								    // 각 게시글에 대한 댓글 데이터 가져오기
		                            List<Reply> replies = new ArrayList<>();
		                            for (int j = 0; j < list2.size(); j++) {
		                                if (list2.get(j).getInquiry_no() == list.get(i).getInquiry_no()) {
		                                    replies.add(list2.get(j));
		                                }
		                            }
							    %>
							    <tr class="question">
							        <td class="table_text"><%= list.size()-i %></td>
							        <td class="table_text"><%= list.get(i).getInquiry_title() %><img src="../../resources/images/토글.png" class="toggle_icon"></td>
							        <td class="table_text"><%= dtf.format(list.get(i).getInquiry_reg_date()) %></td>
							        <td class="table_text"><%= dtf.format(list.get(i).getInquiry_mod_date()) %></td>
							    </tr>
								<tr class="answer">
							        <td class="table_text" colspan="1"></td>
							        <td class="table_text" style="text-align: left;">
							        <div style="padding: 20px">
							        	<%= formatInquiryText(list.get(i).getInquiry_text()) %>
							        </div>
		                             <% for (Reply reply : replies) { %>
							        <hr> <!-- 답변과 질문 사이에 구분선 추가 -->
		                            <div style="padding:20px">
		                            <div class="answer_div" style="background-color:#4c9cf7; color:white; text-align:center; width:80px; height:40px; align-items: center; font-size:20px; padding-top:1px;">답변</div>
		                            <br>
		                            <%= formatInquiryText(reply.getReply_text()) %>
		                            </div>
		                            <%} %>
							        </td>
							        <td class="table_text" colspan="2">
							                   <% if (!hideButtons) { %>
									                <button class="edit_button" type="button" onclick="edit_page(<%= list.get(i).getInquiry_no() %>);">수정</button>
									                <button class="delete_button" type="button" onclick="delete_page(<%= list.get(i).getInquiry_no() %>);">삭제</button>
            									<% } %>
							        </td>
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
		<div class="center" style="margin-top:100px; margin-left:49%;">
			<div class="pagination">
				<% if(paging.isPrev()){ %>
					<a href="/myInquiryboard/list?nowPage=<%=(paging.getPageBarStart()-1)%>">
						&laquo;
					</a>
				<%} %>
				<% for(int i=paging.getPageBarStart(); i<=paging.getPageBarEnd(); i++){ %>
					<a href="/myInquiryboard/list?nowPage=<%=i%>"
					<%=paging.getNowPage() == i ? "class='active'" : "" %>>
						<%=i %>
					</a>
				<% }%>
				<% if(paging.isNext()){%>
					<a href="/myInquiryboard/list?nowPage=<%=(paging.getPageBarEnd()+1)%>">&raquo;</a>
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