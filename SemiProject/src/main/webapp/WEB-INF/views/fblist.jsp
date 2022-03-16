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
			
.post {
	text-align: center;
}

.get {
	text-align: center;
	font-size: 13px;
	margin: 10px;
}

ul li a {
	text-decoration-line: none;
	color: black;
}

table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	border-bottom: 1px solid #444444;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

.no {
	width: 60%;
	margin-left: 20%
}

a {
	text-decoration: none !important;
}

a:link {
	color: black;
}

a:visited {
	color: black;
}

a:hover {
	color: black;
}

a:active {
	color: black
}

.postbtn {
	padding-left: 5px;
	padding-right: 5px;
}

</style>
<body>
		<header>
			<%@include file ="header.jsp" %>
		</header>
			<div style="width: 100%; margin-top: 5em;">
		<div class="post">
			<span> <span class="postbtn"><a href="mypage">회원 수정</a></span>
				<span class="postbtn"><a href="changepw">비밀번호 변경</a></span> <span
				class="postbtn"><a href="fblist"><b>내가 쓴 글</b></a></span> <span
				class="postbtn"><a href="delete">회원 탈퇴</a></span>
			</span>
		</div>
		<div class="get">
			<span> <span class="postbtn"><a href="todaylist">오늘의
							러닝</a></span> <span class="postbtn"><a href="routelist">코스공유</a></span> <span
				class="postbtn"><a href="fblist"><b>자유게시판</b></a></span> <span
				class="postbtn"><a href="matelist">런닝메이트</a></span>
			</span>
		</div>
	</div>
	<div class="no justify-content-center">
	
	
	<h2	style="font-size: 25px; text-align: center; margin-top: 40px; color: green">자유게시판</h2>
		<table >
			<tr style="border-bottom: 1px solid #444444;">
				<th style="text-align: left;   width:20%">no</th>
				<th style="text-align: center; width:50%">제목</th>
				<th style="text-align: center; width:30%">작성일</th>

			</tr>
			
			<c:forEach var="board" items="${fblist}">
					<tr>
						<td>${board.writer}</td>
	    				<td style="text-align: center;"><a href="/fb_detail?fb_articleNo=${board.fb_articleNo }&page=1">${board.fb_title}</a></td>
		 				<td style="text-align: center;">${board.fb_date}</td>
					</tr>
					</c:forEach>
	</table>
	<c:choose>
		<c:when test="${fblist!=null && pageInfo.listCount>0 }">
			<div style="">
			
					
			
			</div>
			<div id="pageList" style="text-align: center; margin-top:30px; margin-bottom :30px;">
			<c:choose>
				<c:when test="${pageInfo.page<=1}">
					«&nbsp;
				</c:when>
				<c:otherwise>
					<a href="fblist?page=${pageInfo.page-1}">«&nbsp;</a>
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				<c:choose>
					<c:when test="${pageInfo.page==i }">
						${i }&nbsp;
					</c:when>
					<c:otherwise>
						<a href="fblist?page=${i}">${i }&nbsp;</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					»&nbsp;
				</c:when>
				<c:otherwise>
					<a href="fblist?page=${pageInfo.page+1}">»&nbsp;</a>
				</c:otherwise>
			</c:choose>
			</div>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="3" style="text-align: center;"><b>작성한 글이 없습니다.</b></td>
			</tr>
		</c:otherwise>
	</c:choose>
	
	</div>
</body>
</html>