<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<html>
<head>
<title>회원가입</title>
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
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
	<%@ include file ="../include/new_header.jsp" %>
	<section style="margin-top: 10px; display: flex; justify-content: center; align-items: center;">
		<div id="section_wrap" style="margin-top: 300px">
			<div class="word">
				<h3>회원가입</h3>
				<br>
			</div><br>
			<div class="create_account_form">
				<form name="create_account_form" action="/user/createEnd" method="post">
					<label for="user_id">아이디</label>
					<input type="text" id="user_id" name="user_id" placeholder="영문6글자이상 10자이하">
					<button type="button" onclick="idCheck();" id="idBoxBottomRight" name="idBoxBottomRight" disabled>중복확인</button>
					<div id="idCheckBox"></div>
					<label for="user_pw">비밀번호</label>
					<input type="password" name="user_pw" id="user_pw" placeholder="비밀번호"> <br>
					<label for="user_pw_check">비밀번호 확인</label>
					<input type="password" name="user_pw_check" id="user_pw_check" placeholder="비밀번호 확인"> <br>
					<label for="user_nick">닉네임</label>
					<input type="text" id="user_nick" name="user_nick" placeholder="2글자이상 입력해주세요." >
					<button type="button" onclick="nickCheck();" id="nickBoxBottomRight" name="nickBoxBottomRight" disabled>중복확인</button>
					<div id="nickCheckBox"></div>
					
					<label for="user_question">비밀번호 확인용 질문입니다.</label><br>
					<select  id="user_question" name="user_question">
						<option value=0>선택해주세요.</option>
						<option value=1>어머니의 성함은?</option>
						<option value=2>가장 좋아하는 계절은?</option>
						<option value=3>지금 사는 지역은?</option>
						<option value=4>가장 좋아하는 색깔은?</option>
						<option value=5>가장 좋아하는 배우는?</option>
						<option value=6>가장 좋아하는 프로그램은?</option>
						<option value=7>가장 좋아하는 영화는?</option>
						<option value=8>가장 좋아하는 친구는?</option>
						<option value=9>가장 좋아하는 음식은?</option>
						<option value=10>가장 좋아하는 여행지는?</option>
					</select><br>
					
					
					<input type="text"  id="user_answer" name="user_answer" placeholder="질문의 답을 적어주세요."><br>
					
					
					<label for="user_email">이메일</label>
					<input type="email" name="user_email" id="user_email"><br>
					<label for="user_address">주소</label>
					<input type="text" id="user_address" name="user_address" value="주소찾기 클릭"><br>
					<input type="button" value="회원가입" onclick="createUserForm();">
					<input type="reset" value="초기화">
				</form>
			</div>
				<a href="/user/login">로그인</a>
			</div>
		
	</section>	
	
	<script>
	
	const contextPath = '<%= request.getContextPath() %>';
	
	let idChecked = false;
	let nickChecked =false;
		
	// 아이디, 닉네임 중복확인 버튼관련,사용자가 입력을 완료한 후에 버튼 활성화
	document.getElementById("user_id").addEventListener("input", function() {
	    document.getElementById("idBoxBottomRight").disabled = this.value.length < 6 || this.value.length > 10;
	    idChecked = false;
	});

	document.getElementById("user_nick").addEventListener("input", function() {
	    document.getElementById("nickBoxBottomRight").disabled = this.value.length < 2;
	    nickChecked = false;
	});
		
	// 아이디 중복확인
	document.getElementById("idBoxBottomRight").addEventListener("click", function() {
    const mid = document.getElementById("user_id").value;
    console.log(mid);
    $.ajax({
        type: 'GET',
        url : contextPath + '/IdcheckServlet?user_id=' + mid,
        success: function(result){
            if(result == 1){
                $('#idCheckBox').text("사용가능한 아이디입니다.");
                $('#idCheckBox').css("color","blue");
                idChecked = true;
            } else {
                $('#idCheckBox').text("이미 사용중인 아이디입니다.");
                $('#idCheckBox').css("color","red");
                idChecked = false;
            }
        },
        error: function(request, status, error){
            console.log(request.status);
            console.log(request.responseText);
            console.log(error);
        }
    }); 
});

		// 닉네임 중복확인

	document.getElementById("nickBoxBottomRight").addEventListener("click", function() {
			const mnick = $("#user_nick").val();
			$.ajax({
				type : 'GET',
				url : contextPath + '/NickcheckServlet?user_nick=' + mnick,
				success : function(result){
					if(result == 1){
						$('#nickCheckBox').text("사용가능한 닉네임입니다.");
						$('#nickCheckBox').css("color","blue");
						nickChecked = true;
					
					}else {
						$('#nickCheckBox').text("이미 사용중인 닉네임입니다.");
						$('#nickCheckBox').css("color","red");
						nickChecked = true;
					}
				},
				error : function(request, status, error){
					console.log(request.status);
					console.log(request.responseText);
					console.log(error);
				}
			
			
				});	
			});

		function createUserForm(){
			
		
			const form = document.create_account_form;
			
			// 이메일 유효성 검사 정규식
			const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			
			// // 아이디 유효성 검사 정규식 (영문 6글자 이상 10글자 이하)
			const idRegex = /^[A-Za-z0-9]{6,10}$/;
			
			if(!form.user_id.value){
				alert("아이디를 입력하세요.");
				form.user_id.focus();
			
				 //form.user_id.value -> 비어있는 문자열 -> false -> ! -> true
				// 아이디 유효성 검사 추가
		    } else if (!idRegex.test(form.user_id.value)) {
		        alert("아이디는 영문 6글자 이상 10글자 이하로 입력하세요.");
		        form.user_id.focus();
				
			} else if(!form.user_pw.value){
				alert("비밀번호를 입력하세요");
				form.user_pw.focus();
			
				
			} else if(!form.user_pw_check.value){
				alert("비밀번호 확인을 입력하세요.")
				form.user_pw_check.focus();
				
			} else if(form.user_pw.value != form.user_pw_check.value){
				alert("비밀번호가 일치하는지 확인하세요.");
				form.user_pw.focus();
				
			} else if(!form.user_nick.value){
				alert("닉네임을 입력하세요.");
				form.user_nick.focus();
				
			} else if(!form.user_email.value){
				alert("이메일을 입력하세요.");
				form.user_email.focus();
				
				// 이메일 유효성 검사 추가
		    } else if (!emailRegex.test(form.user_email.value)) {
		        alert("올바른 이메일 형식을 입력하세요.");
		        form.user_email.focus();
				
				
			} else if(!form.user_address.value){
		        alert("주소를 입력하세요.");
		        form.user_address.focus();
		        
		    } else if (form.user_question.value == "0") {
                alert("질문을 선택하세요.");
                form.user_question.focus();
                
            } else if (!form.user_answer.value) {
                alert("질문의 답을 입력해주세요.");
                form.user_answer.focus();
                
		    }else if(!idChecked){
		        alert("아이디 중복 검사를 완료하세요.");
		        form.user_id.focus();
		        
		    } else if(!nickChecked){
		        alert("닉네임 중복 검사를 완료하세요.");
		        form.user_nick.focus();
		        
		    } else {
				form.submit();
			}
		}
	
		
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("user_address").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("user_address").value = data.address; // 주소 넣기
            }
        }).open();
    });
}
</script>

</html>
