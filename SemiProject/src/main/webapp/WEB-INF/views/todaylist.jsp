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
<%@include file="mypageheader.jsp" %>
<%@include file ="contentlisthead.jsp" %>
<body>
	<h2>내가 쓴 글</h2>
	<table border=1 > 
	<tr>
		<th>번호</th>
		<th>제목</th>
	</tr>
	<c:choose>
		<c:when test="${empty memberInfo.contentlist}">
		<tr>
			<td colspan="2">
				<b>작성한 글이 없습니다.</b>
			</td>
		</tr>
		</c:when>
		
		<c:when test="${!empty memberInfo.contentlist}">
			<c:forEach var='contentlist' items="${memberInfo.contentlist}">
				<tr>
	    			<td>${contentlist.today_articleNo}</td>
		 			<td>${contentlist.today_title}</td>
				</tr>
			</c:forEach>
		</c:when>
	</c:choose>	
	</table>
</body>
</html>