<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
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
	
	.form1 {
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
	
	.form1 h2 {
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
	
	.name {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	
	.phone {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}	
	
	.email {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}		
	
	.btn {
	  position:relative;
	  left:40%;
	  transform: translateX(-50%);
	  margin-bottom: 40px;
	  width:80%;
	  height:40px;
	  background: linear-gradient(125deg,#81ecec,#6c5ce7,#81ecec);
	  background-position: left;
	  background-size: 200%;
	  color:white;
	  font-weight: bold;
	  border:none;
	  cursor:pointer;
	  transition: 0.4s;
	  display:inline;
	}
	
	.btn:hover {
	  background-position: right;
	}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "join";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#phone").val()==""){
					alert("번호를 입력해주세요.");
					$("#name").focus();
					return false;
				}
				if($("#email").val()==""){
					alert("이메일을 입력해주세요.");
					$("#email").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
	<body>
	<header>
	<%@include file ="mypageheader.jsp" %></header>
			<form name="form1" method="post" class="form1">
				<h2>회원 정보 수정</h2>
				<div style="margin: 30px;padding: 10px 10px;">
					<img src="/profileview/${member.memberthumb }" onerror="this.src='/profile/다운로드.jpg'" width="100px" height="100px"  />
					<input type="file" id="file" name="file" />
				</div>
				<div class="textForm">
					<input class="id" type="text" id="id" name="id" value="${member.id }" readonly="readonly" placeholder="아이디" />
				</div>
				<div class="textForm">
					<input class="name" type="text" id="name" name="name" value="${member.name}" readonly="readonly" placeholder="이름" />
				</div>
				<div class="textForm">
					<input class="email" type="text" id="email" name="email" value="${member.email}" placeholder="이메일"/>
				</div>
				<div class="textForm">
					<input class="phone" type="text" id="phone" name="phone" value="${member.phone}" placeholder="전화번호"/>
				</div>
				<div>
					<button class="btn" type="submit" id="submit">회원정보수정</button>
					<button class="btn" type="button">취소</button>
				</div>
			</form>
		<script>
			$(document).ready(function(){
				$('#submit').click(function(){
					document.form1.action = "update";
					document.form1.submit();
				});
			});
		</script>
	</body>
	
</html>