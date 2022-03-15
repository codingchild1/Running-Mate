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
		text-decoration-line: none;
		float: left;
		margin: 10px;
		list-style: none;
	}
	.post {
		position: absolute;
		left: 25%;
		width: 1000px;
		margin-top: 51px;
		justify-content: space-between;
	}
	
	.get li {
		text-decoration-line: none;
		float: left;
		margin: 10px;
		list-style: none;
	}
	.get {
		position: absolute;
		top: 18%;
		left: 26%;
		font-size: 12px;
		width: 1000px;
		margin-top: 51px;
		justify-content: space-between;
	}
	ul li a {
		text-decoration-line: none;
		color: black;
	}

  	table {
	    width: 100%;
	    border-top: 1px solid #444444;
	    border-collapse: collapse;
  	}
  	th, td {
    	border-bottom: 1px solid #444444;
   		padding: 10px;
  }
	.no{
	  padding: 30px, 20px;
	  background-color:#FFFFFF;
	  text-align:center;
	  border-radius: 15px;
	  width: 60%;
	  justify-content: center;
	  margin: auto;
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
			<div class="get">
				<ul>
					<li><a href="todaylist">오늘의 런닝</a></li>
					<li><a href="routelist">루트 공유</a></li>
					<li><a href="fblist"><b>자유게시판</b></a></li>
					<li><a href="matelist">런닝 메이트</a></li>
				</ul>
			</div>
	<div class="no">
	<h2>내가 쓴 글</h2>
	
	<c:choose>
		<c:when test="${fblist!=null && pageInfo.listCount>0 }">
			<div style="">
				
				<table border="1" align="center"> 
					<tr>
						<th>no</th>
						<th>제목</th>
						<th>날짜</th>
					</tr>
					<c:forEach var="board" items="${fblist}">
					<tr>
						<td>${board.fb_articleNo}</td>
	    				<td><a href="/fb_detail?fb_articleNo=${board.fb_articleNo }&page=1">${board.fb_title}</a></td>
		 				<td>${board.fb_date}</td>
					</tr>
					</c:forEach>
				</table>
			
			</div>
			<div id="pageList" style="text-align: center; margin-top:30px; margin-bottom :30px;">
			<c:choose>
				<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
				<c:otherwise>
					<a href="fblist?page=${pageInfo.page-1}">[이전]</a>&nbsp;
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				<c:choose>
					<c:when test="${pageInfo.page==i }">
						[${i }]
					</c:when>
					<c:otherwise>
						<a href="fblist?page=${i}">[${i }]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
				<c:otherwise>
					<a href="fblist?page=${pageInfo.page+1}">[다음]</a>
				</c:otherwise>
			</c:choose>
			</div>
		</c:when>
		<c:otherwise>
			<tr>
				<td colspan="3">
					<b>작성한 글이 없습니다.</b>
				</td>
			</tr>
		</c:otherwise>
	</c:choose>
	</div>
</body>
</html>