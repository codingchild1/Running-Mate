<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
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
			
			.form2 {
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
			}
			
			.form2 h2 {
			  text-align: center;
			  margin: 30px;
			}
			
			.textForm {
			  border-bottom: 2px solid #adadad;
			  margin: 30px;
			  padding: 10px 10px;
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
			
			.newpassword {
			  width: 100%;
			  border:none;
			  outline:none;
			  color: #636e72;
			  font-size:16px;
			  height:25px;
			  background: none;
			}
			
			.newpassword2 {
			  width: 100%;
			  border:none;
			  outline:none;
			  color: #636e72;
			  font-size:16px;
			  height:25px;
			  background: none;
			}				
			
			#submit {
			  position:relative;
			  left:40%;
			  transform: translateX(-50%);
			  margin-bottom: 40px;
			  width:80%;
			  height:40px;
			  font-weight: bold;
			  transition: 0.4s;
			  display:inline;
			  background-color: #59ab6e; 
			  border-radius: .25rem;
			  color: white;
			}
			
			
		
			.btn:hover {
			  background-position: right;
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


		</style>

		<title>비밀번호 변경</title>
	</head>
	<body>
		<header>
			<%@include file ="header.jsp" %>
		</header>
			<div style="width: 100%; margin-top: 5em;">
			<div class="post">
			<span> <span class="postbtn"><a href="mypage">회원 수정</a></span>
				<span class="postbtn"><a href="changepw"><b>비밀번호 변경</b></a></span> <span
				class="postbtn"><a href="fblist">내가 쓴 글</a></span> <span
				class="postbtn"><a href="delete">회원 탈퇴</a></span>
			</span>
		</div>
		</div>
		 <form method="post" name="form2" class="form2">
       		<h2>비밀번호 변경</h2>
		    <div>
		        <div>
		            <div>
		                <div class="textForm">
		                    <input type="password" name="password" id="password" class="password" placeholder="현재 비밀번호" />
		                </div>
		                <div class="textForm">
		                    <input type="password" name="newPw" id="newPw" class="newpassword" placeholder="새 비밀번호" />
		                </div>
		                <div class="textForm">
		                    <input type="password" name="newPwCheck" id="newPwCheck" class="newpassword2" placeholder="새 비밀번호 확인" />
		                </div>
		                <button type="submit" id="submit" name="submit" class="btn" >비밀번호 변경</button>
		                
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