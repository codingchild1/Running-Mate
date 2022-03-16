<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
    <style>

	 * {
	  margin: 0px;
	  padding: 0px;
	  text-decoration: none;
	  font-family:sans-serif;
	
	}
	
	body {
	  background-image:#34495e;
	}
	
	.form3 {
	  position:absolute;
	  width:400px;
	  height:400px;
	  padding: 30px, 20px;
	  background-color:#FFFFFF;
	  text-align:center;
	  top:40%;
	  left:50%;
	  transform: translate(-50%,-50%);
	  border-radius: 15px;
	}
	
	.form3 h2 {
	  text-align: center;
	  margin: 30px;
	}
	
	.textForm {
	  border-bottom: 2px solid #adadad;
	  margin: 30px;
	  padding: 10px 10px;
	}
	
	
	.id {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	
	.password {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	
	#btn{
		position:relative;
		margin-bottom: 40px;
		left:8%;
	    width:80%;
	    height:40px;
		width: 25;
		height: 40px;
		padding: 6px 6px;
		margin: 7px;
		background-color: #59ab6e; 
		border-radius: .25rem;
		color: white;
	}
	</style>
</head>
<body>
	<header>
		<%@include file ="header.jsp" %>
    </header>
       		<form id='form3' action="login" method="post" class="form3">
       		<h2>로그인</h2>
            <div class="textForm">
                <input type="text"  class="id"  id="id" name="id" placeholder="id" autofocus>
            </div>
            <div class="textForm">
                <input type="password" class="password" id="password" name="password" placeholder="password">
            </div>
            <div class="d-grid">
                <input type="submit" id="btn" class="btn" value='로그인' />
            </div>
        </form>
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
</body>
</html>