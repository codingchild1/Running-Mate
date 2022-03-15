<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<style>
			
	.post li {
		float: left;
		margin: 10px;
		list-style: none;
	}
	.post {
		display: inline-flex;
		width: 1060px;
		margin-top: 51px;
		justify-content: space-between;
	}
	ul li a {
		text-decoration-line: none;
		color: black;
	}
	</style>
<body>
		<header>
			<%@include file ="header.jsp" %>
		</header>
			<div class="post">
				<ul>
					<li><a href="mypage">회원 수정</a></li>
					<li><a href="changepw">비밀번호 변경</a></li>
					<li><a href="fblist"><b>내가 쓴 글</b></a></li>
					<li><a href="delete">회원 탈퇴</a></li>
				</ul>
			</div>
			<div>
				<ul>
					<li><a href="todaylist"><b>오늘의 런닝</b></a></li>
					<li><a href="routelist">루트 공유</a></li>
					<li><a href="fblist">자유게시판</a></li>
					<li><a href="#">런닝 메이트</a></li>
				</ul>
			</div>
	<h2>내가 쓴 글</h2>
	<table border="1" align="center"> 
	<tr>
		<th>no</th>
		<th>제목</th>
		<th>날짜</th>
	</tr>
	<c:choose>
		<c:when test='${empty todaylist}'>
		<tr>
			<td colspan="3">
				<b>작성한 글이 없습니다.</b>
			</td>
		</tr>
		</c:when>
		<!-- db -->
		<c:otherwise>
			<c:forEach var="today" items="${todaylist}">
				<tr>
					<td>${today.today_articleNo}</td>
	    			<td>${today.today_title}</td>
		 			<td>${today.today_date}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</table>
</body>
</html>