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
</head>
<body>
	<h2>회원목록 조회</h2>
<table border=1 > 
<tr>
	<th>체크</th>
	<th>아이디</th>
	<th>링크</th>
	<th>신고날짜</th>
	<th>횟수</th>
</tr>
<c:choose>
	<c:when test="${empty warninglist}">
	<tr>
		<td colspan="5">
			<b>등록된 회원이 없습니다.</b>
	</tr>
	</c:when>
	
	<c:when test="${!empty warninglist}">
		<c:forEach var='warning' items="${warninglist}">
			<tr>
				<td><input name="RowCheck" type="checkbox" value="${warning.warningNo}"/></td>
    			<td>${warning.warningId}</td>
	 			<td>${warning.link}</td>
	 			<td>${warning.warningDate}</td>
	 			<td>${warning.warningCnt}</td>
			</tr>
		</c:forEach>
	</c:when>
</c:choose>	 
</table>
</body>
</html>
