<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>탈퇴 화면</title>
    
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
	
	.form4 {
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
	
	.form4 h2 {
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

	
	
	
	#submit {
		  position:relative;
		  left:21%;
		  transform: translateX(-50%);
		  margin-bottom: 40px;
		  width:165px;
		  height:30px;
		  border: none;
		  font-weight: bold;
		  transition: 0.4s;
		  display:inline;
		  background-color: #59ab6e; 
		  border-radius: .25rem;
		  color: white;
		  
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
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
    // 비밀번호 미입력시 경고창
	    function checkValue(){
	        if(!document.deleteform.password.value){
	            alert("비밀번호를 입력하지 않았습니다.");
	            return false;
	        }
	    }

    </script>
    
</head>
<body>
	<header>
			<%@include file ="header.jsp" %>
		</header>
		<div style="width: 100%; margin-top: 5em;">
			<div class="post">
			<span> <span class="postbtn"><a href="mypage">회원 수정</a></span>
				<span class="postbtn"><a href="changepw">비밀번호 변경</a></span> <span
				class="postbtn"><a href="fblist">내가 쓴 글</a></span> <span
				class="postbtn"><a href="delete"><b>회원 탈퇴</b></a></span>
			</span>
		</div>
		</div>
    	<form name="deleteform" method="post" class="form4" action="delete" onsubmit="return checkValue()">
                <h2>회원 탈퇴</h2>
                <div class="textForm">
               		 <input type="password" id="password" class="password" name="password">
                </div>
		        <input type="submit" id="submit" value="탈퇴" /> 
		        <input type="button" id="submit" value="취소" onclick="location.href='mypage'" />
    	</form>

</body>
</html>