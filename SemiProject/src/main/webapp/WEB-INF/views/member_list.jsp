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
	<th>이름</th>
	<th>가입날짜</th>
	<th>전화번호</th>
	<th>이메일</th>
	<th>주소</th>
</tr>
<c:choose>
	<c:when test="${empty memberlist}">
	<tr>
		<td colspan="7">
			<b>등록한 회원이 없습니다.</b>
	</tr>
	</c:when>
	
	<c:when test="${!empty memberlist}">
		<c:forEach var='member' items="${memberlist}">
			<tr>
				<td><input name="RowCheck" type="checkbox" value="${member.no}"/></td>
    			<td>${member.id}</td>
	 			<td>${member.name}</td>
	 			<td>${fn:substring(member.joindate, 0, 10)}</td>
	 			<td>${member.phone}</td>
	 			<td>${member.email}</td>
	 			<td>${member.address}</td>
			</tr>
		</c:forEach>
	</c:when>
</c:choose>	 
</table>
</body>
</html>