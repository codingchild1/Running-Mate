<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)request.getAttribute("id");
	String name = (String)request.getAttribute("name");
	String phone = (String)request.getAttribute("phone");
	String eamil = (String)request.getAttribute("eamil");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="mypageheader.jsp" %>
</head>
<body>
	<form action="update_ok" method="post">
        <label>사진</label>
        <input type="file" name="image"><br>
		<label>아이디</label>
		<input type="text" name="id" value="<%=id %>" readonly /><br>
		<label>이름</label>
		<input type="text" name="name" value="<%=name%>" readonly /><br>
		<label>비밀번호</label>
		<input type="password" name="password" id="password" /><br>
		<label>비밀번호 확인</label>
		<input type="password" name="password" id="passwordchk" /><br>
		<label>전화번호</label>
		<input type="text" name="phone1" value="<%=phone%>" /><br>
		<label>이메일</label>
		<input type="text" name="email" value="<%=eamil %>" /><br>
		<input type="submit" value="수정" />
		<input type="button" value="취소" />
	</form>
</body>
</html>