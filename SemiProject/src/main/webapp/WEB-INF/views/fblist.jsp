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
<body>
	<h2>내가 쓴 글</h2>
	<table border="1" align="center"> 
	<tr>
		<th>no</th>
		<th>제목</th>
		<th>날짜</th>
	</tr>
	<c:choose>
		<c:when test='${empty fblist}'>
		<tr>
			<td colspan="3">
				<b>작성한 글이 없습니다.</b>
			</td>
		</tr>
		</c:when>
		
		<c:otherwise>
			<c:forEach var="board" items="${fblist}">
				<tr>
					<td>${board.writer}</td>
	    			<td>${board.fb_title}</td>
		 			<td>${board.fb_date}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</table>
</body>
</html>