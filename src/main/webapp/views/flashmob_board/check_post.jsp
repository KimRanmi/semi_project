<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<!-- <link href="../../resources/css/flashmob/check.css" rel="stylesheet" type="text/css"> -->

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file ="../include/new_header.jsp" %>
<head>
<meta charset="UTF-8">
<title>글 조회</title>
<%@ page import="com.cm.flashmob.vo.Flashmob,java.util.*" %>
<%@ page import="com.cm.flashmob.vo.FlashmobApply" %>
<%@ page import="com.cm.user.vo.User" %>
<%@page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
</head>
<body>

<% 
    Flashmob flashmob = (Flashmob) request.getAttribute("post");
    User who = (User)session.getAttribute("user");
    Integer count = (Integer) request.getAttribute("count");
    String name = (String)request.getAttribute("name");
    
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
%>
<section style="margin-left:750px; margin-top:300px;">
<div class="container">
    <div class="header">
        <div class="title"><%= flashmob.getPost_title() %></div>
        <div class="info">
            <span><%=name%></span>
            <span><%= dtf.format(flashmob.getPost_reg_date())%></span>
            <span>좋아요 <%= flashmob.getLike_count() %></span>
        </div>
    </div>
    <div class="content">
        <p><%= flashmob.getPost_text() %></p>
        <div class="map">
        	<% if (flashmob.getFlashmob_new_image_name() != null) { %>
            <img src="<%= request.getContextPath() + "/upload/" + flashmob.getFlashmob_new_image_name() %>" style="width: 400px; height: 400px;">
            <% } %>
            <table>
                    <colgroup>
                        <col width="10%">
                        <col width="60%">
                        <col width="30%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>이름</th>
                            <th>자기소개</th>
                            <th>신청일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<FlashmobApply> displayList = (List<FlashmobApply>) request.getAttribute("displayList");
                            if (displayList != null) {
                                for (FlashmobApply apply : displayList) { %>
                                    <tr>
                                        <td><%= apply.getUser_nick() %></td>
                                        <td><%= apply.getApplication_text() %></td>
                                        <td><%= apply.getApplication_date() %></td>
                                    </tr>
                                <% } %>
                            <% } %>
                    </tbody>
                </table>
        </div>

        <div class="details">
            <div class="location">
                <strong>모임 위치</strong><br>
                <%= flashmob.getFlashmob_location() %>
            </div>
            <div class="time">
                <strong>모임 시간</strong><br>
                <%= flashmob.getFlashmob_date().toLocalDate() %><br>
                <%= flashmob.getFlashmob_date().toLocalTime() %>
            </div>
        </div>

        <% if (who != null && who.getUser_no() == flashmob.getUser_no()) { %>
            <div class="actions">
                <div class="likes-comments">
                    <span><img src="<%= request.getContextPath() %>/resources/images/free-icon-people-1769041.png" alt="people icon" style="width: 20px; height: 20px;"> <%= count %>/<%= flashmob.getFlashmob_number() %>명</span>
                    <a id="like-button" href="javascript:void(0);"><img src="<%= request.getContextPath() %>/resources/images/free-icon-hearts-138533.png" alt="좋아요" style="width: 20px; height: 20px;"></a>
                </div>
                <a href="/flashmob/delete?post_no=<%= flashmob.getPost_no() %>">삭제하기</a>
                <a href="/flashmob/edit?post_no=<%= flashmob.getPost_no() %>">수정하기</a> 
                <div class="apply">
                <button onclick="openPopup()">신청내역</button>
                </div>
            </div>
            <div id="apply_pop_2" class="apply_pop" style="visibility:hidden;">
                <table>
                    <colgroup>
                        <col width="10%">
                        <col width="60%">
                        <col width="20%">
                        <col width="5%">
                        <col width="5%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>이름</th>
                            <th>자기소개</th>
                            <th>신청일</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<FlashmobApply> list = (List<FlashmobApply>) request.getAttribute("resultList");
                            if (list != null) {
                                for (FlashmobApply apply : list) { %>
                                    <tr>
                                        <td><%= apply.getUser_nick() %></td>
                                        <td><%= apply.getApplication_text() %></td>
                                        <td><%= apply.getApplication_date() %></td>
                                        
                                        <td><a href="javascript:acceptApplication('<%= apply.getApplication_no() %>')">수락</a></td>
                                        <td><a href="javascript:rejectApplication('<%= apply.getApplication_no() %>')">거절</a></td>
                                    </tr>
                                <% } %>
                            <% } %>
                    </tbody>
                </table>
            </div>
        <% } else { %>
            <div class="actions">
                <div class="likes-comments">
                    <span><img src="<%= request.getContextPath() %>/resources/images/free-icon-people-1769041.png" alt="people icon" style="width: 20px; height: 20px;"> <%=count %>/<%= flashmob.getFlashmob_number() %>명</span>
                    <% if(who!=null){ %>
                    <a id="like-button" href="javascript:void(0);"><img src="<%= request.getContextPath() %>/resources/images/free-icon-hearts-138533.png" alt="좋아요" style="width: 20px; height: 20px;"></a>
                <%}else{ %>
                <a href="/user/login"><img src="<%= request.getContextPath() %>/resources/images/free-icon-hearts-138533.png" alt="좋아요" style="width: 20px; height: 20px;"></a>
                <%} %>
                </div>
                <div class="apply">
                <% if(who!=null){ %>
                    <button class="apply_btn" onclick="openPopuptwo()">신청하기</button>
                    <%}else{ %>
                    <button type="submit" onclick="gologin()">신청하기</button>
                    <%} %>
                </div>
            </div>

            <div id="apply_pop" class="apply_pop" style="visibility:hidden;">
                <h2>모임 신청</h2>
                <div class="pop_inner">
                    <form id="applyForm" action="/flashmob/apply" method="post">
                        <input type="hidden" name="postNo" value="<%= flashmob.getPost_no() %>">
                        <label for="about_me">자기소개</label>
                        <input type="text" name="introduce" id="about_me" placeholder="간단한 자기소개를 해주세요">
                        
                        <button type="submit" onclick="submitApplication()">신청</button>
                        <button type="button" onclick="closePopup()">취소</button>
                    </form>
                </div>
            </div>
        <% } %>
    </div> 
</div> 
</section>
<script>
var postNo = '<%= flashmob.getPost_no() %>';

$(document).ready(function() {
    $("#like-button").click(function() {
        var postNo = '<%= flashmob.getPost_no() %>'; // JSP에서 postNo를 가져옵니다.

        $.ajax({
            url: '/flashmob/check', 
            type: 'POST',
            data: { post_no: postNo }, 
            success: function(response) {
				alert('처리가 완료되었습니다.');
            },
            error: function() {
                alert('서버 오류가 발생했습니다.');
            }
        });
    });
});
function acceptApplication(applicationNo) {
    if (confirm("이 신청을 수락하시겠습니까?")) {
        window.location.href = '/flashmob/accept?yn=Y&applyNo=' + encodeURIComponent(applicationNo) + '&postNo=' + encodeURIComponent(postNo);
    }
} 

function rejectApplication(applicationNo) {
    if (confirm("이 신청을 거절하시겠습니까?")) {
        window.location.href = '/flashmob/accept?yn=N&applyNo=' + encodeURIComponent(applicationNo) + '&postNo=' + encodeURIComponent(postNo);
    }
}
function openPopup() {
	document.getElementById('apply_pop_2').style.visibility = 'visible';
}
function gologin(){
	console.log("비로그인");
	window.location.href='/user/login';
}
function openPopuptwo() {
    document.getElementById('apply_pop').style.visibility = 'visible';
}
function closePopup() {
    document.getElementById('apply_pop').style.display = 'none';
}

function submitApplication() {
    document.getElementById('applyForm').submit();
}
</script>

</body>
</html>
