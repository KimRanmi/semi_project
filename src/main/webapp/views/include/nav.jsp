
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href='../../resources/css/include/nav.css' rel="stylesheet" type="text/css">
<nav>
		<div class="menu">
			<ul>
				<li>
					<a href="/qboard/create">게시글 등록</a>
				</li>
				<li>
					<a href="/user/logout">로그아웃</a>
				</li>
				<li>
					<a href="/qboard/update">계정 수정</a>
				</li>
			</ul>
		</div>	
		<div class="search">
			<form action="/qboard/list" name="search_board_form" method="get">
				<input type="text" name="post_title" placeholder="검색하고자하는 게시글의 제목을 입력하세요.">
				<input type="submit" value="검색">
			</form>
		</div>
	</div>
</nav>	