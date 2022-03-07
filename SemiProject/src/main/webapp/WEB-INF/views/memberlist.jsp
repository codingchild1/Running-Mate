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
	<th>#</th>
	<th>아이디</th>
	<th>이름</th>
	<th>가입날짜</th>
	<th>전화번호</th>
	<th>이메일</th>
</tr>
<c:choose>
	<c:when test="${empty list}">
	<tr>
		<td colspan="6">
			<b>등록한 회원이 없습니다.</b>
	</tr>
	</c:when>
	
	<c:when test="${!empty list}">
		<c:forEach var='member' items="${list}">
			<tr>
				<td><input type="checkbox" name="RowCheck" value="${member.articleNO}"/></td>
    			<td>${member.id}</td>
	 			<td>${member.name}</td>
	 			<td>${member.joindate}</td>
	 			<td>${member.phone}</td>
	 			<td>${member.email}</td>
			</tr>
		</c:forEach>
	</c:when>
</c:choose>
</table>
</body>
</html>