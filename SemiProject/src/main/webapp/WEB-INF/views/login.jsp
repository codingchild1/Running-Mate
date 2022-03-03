<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@include file ="header.jsp" %>
    <!-- Latest compiled and minified CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script> 
    <style>
        .container {
            width: 400px;
        }

        .input-group-text {
            display: inline-block;
            width: 130px;
        }

        .title {
            text-align: center;
            font-weight: bold;
        }
    </style> 
</head>
<body>
   <div class="container mt-3">
        <h5 class='title'>로그인</h5>
        <form id='form' action="login" method="post">
            <div class="input-group mb-2">
                <span class="input-group-text title">아이디</span>
                <input type="text" class="form-control" id="id" name="id"><br>
            </div>
            <div class="input-group mb-2">
                <span class="input-group-text title">비밀번호</span>
                <input type="password" class="form-control" id="password" name="password">
            </div>
            <div class="d-grid">
                <input type="submit" class="btn btn-primary btn-block" value='로그인'>
            </div>
        </form>
    </div> 
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
        $(function () {
            form.onsubmit = function () {
                let id = $('#id').val();
                if(id=='') {
                	alert("아이디를 입력하세요.");
                	$('#id').focus();
                	return false;
                }
                let password = $('#password').val();
                if(password=='') {
                	alert("비밀번호를 입력하세요.");
                	$('#password').focus();
                	return false;
                }
            }
        });
    </script>  
    <%@include file ="fotter.jsp" %>
</body>
</html>