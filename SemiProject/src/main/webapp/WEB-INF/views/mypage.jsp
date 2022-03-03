<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)request.getAttribute("id");
	String name = (String)request.getAttribute("name");
	String phone1 = (String)request.getAttribute("phone1");
	String phone2 = (String)request.getAttribute("phone2");
	String phone3 = (String)request.getAttribute("phone3");
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
		<input type="text" name="phone1" value="<%=phone1%>" />-
		<input type="text" name="phone2" value="<%=phone2%>" />-
		<input type="text" name="phone3" value="<%=phone3%>" /><br>
		<label>이메일</label>
		<input type="text" name="email" value="<%=eamil %>" /><br>
		<input type="submit" value="수정" />
		<input type="button" value="취소" />
	</form>
</body>
</html>