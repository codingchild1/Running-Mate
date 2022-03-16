<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	
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
	  top:50%;
	  left:50%;
	  transform: translate(-50%,-50%);
	  border-radius: 15px;
	  margin-bottom: 500px;
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

		.post {
	text-align: center;
}

.get {
	text-align: center;
	font-size: 13px;
	margin: 10px;
}

ul li a {
	text-decoration-line: none;
	color: black;
}

table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	border-bottom: 1px solid #444444;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}

.no {
	width: 60%;
	margin-left: 20%
}

a {
	text-decoration: none !important;
}

a:link {
	color: black;
}

a:visited {
	color: black;
}

a:hover {
	color: black;
}

a:active {
	color: black
}

.postbtn {
	padding-left: 5px;
	padding-right: 5px;
}
	#submit {
		  position:relative;
		  left:21%;
		  transform: translateX(-50%);
		  margin-bottom: 40px;
		  width:165px;
		  height:35px;
		  border: none;
		  font-weight: bold;
		  transition: 0.4s;
		  display:inline;
		  background-color: #59ab6e; 
		  border-radius: .25rem;
		  color: white;
		  
	}
	#btn {
		  position:relative;
		  left:20%;
		  top: -18px;
		  transform: translateX(-50%);
		  margin-bottom: 40px;
		  width:165px;
		  height:35px;
		  border: none;
		  font-weight: bold;
		  transition: 0.4s;
		  display:inline;
		  background-color: #59ab6e; 
		  border-radius: .25rem;
		  color: white;
		  
	}
	</style>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "main";
						    
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
			<%@include file ="header.jsp" %>
		</header>
			<div style="width: 100%; margin-top: 5em;">
			<div class="post">
			<span> <span class="postbtn"><a href="mypage"><b>회원 수정</b></a></span>
				<span class="postbtn"><a href="changepw">비밀번호 변경</a></span> <span
				class="postbtn"><a href="fblist">내가 쓴 글</a></span> <span
				class="postbtn"><a href="delete">회원 탈퇴</a></span>
			</span>
		</div>
		</div>
			<form name="form1" method="post" class="form1" enctype="multipart/form-data">
				<input type="hidden" value="1" id="fileChange" name="fileChange" />
				<h2>회원 정보 수정</h2>
				<div style="margin: 30px;padding: 10px 10px;">
					<img src="/profileview/${member.memberthumb }" id="img" onerror="this.src='/profile/profile.png'" style="width:100px; height:100px;  border-radius:70%;" />
					<input type="file" id="profile" name="profile" />
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
					<button class="cencle" type="button" id="btn">취소</button>
				</div>
			</form>
		<script>
			$(document).ready(function(){
				$('#profile').change(function(event){
					var reader = new FileReader();
					reader.onload = function(e) {
						$("#img").attr("src", e.target.result);
					};
					$("#fileChange").val("0");
					reader.readAsDataURL(event.target.files[0]);
				});
				
				$('#submit').click(function(){
					document.form1.action = "update";
					document.form1.submit();
				});
			});
		</script>
	</body>
	
</html>