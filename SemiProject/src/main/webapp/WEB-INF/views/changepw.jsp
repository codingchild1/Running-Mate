<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	

		<title>비밀번호 변경</title>
	</head>
	<body>
		 <form method="post" name="form2">
                       <input type="text" id="id" name="id" value="<%=session.getAttribute("id")%>" readonly="readonly">
    <div class="col-sm-8 col-sm-offset-2">
        <div class="panel panel-default panel-margin-10">
            <div class="panel-body panel-body-content text-center">
                <p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
                <div class="form-group">
                    <input type="password" name="password" id="password" class="form-control form-control-inline text-center" placeholder="현재 비밀번호" />
                </div>
                <div class="form-group">
                    <input type="password" name="newPw" id="newPw" class="form-control form-control-inline text-center" placeholder="새 비밀번호" />
                </div>
                <div class="form-group">
                    <input type="password" name="newPwCheck" id="newPwCheck" class="form-control form-control-inline text-center" placeholder="새 비밀번호 확인" />
                </div>
                <button type="submit" id="submit" name="submit" class="btn btn-primary">비밀번호 변경</button>
                <!--  <a href="/member/infoView" class="btn btn-default">취소</a>-->
            </div>
        </div>
    </div>
    </form>
    <script src="/cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#submit').click(function(){
				document.form2.action = "changepw";
				document.form2.submit();
			});
		});
	</script>
	</body>
	
</html>