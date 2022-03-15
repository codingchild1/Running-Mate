<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	
	.joinForm {
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
	
	.joinForm h2 {
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
	
	.pw {
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
	
	.email {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	
	.nickname {
	  width: 100%;
	  border:none;
	  outline:none;
	  color: #636e72;
	  font-size:16px;
	  height:25px;
	  background: none;
	}
	
	.cellphoneNo {
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
</head>
<body>
	<header>
		<%@include file ="header.jsp" %>
    </header>
        <form id='form' action="join" method="post" enctype="multipart/form-data" class="joinForm" >
                <h2>회원가입</h2>
        		<img id="memberthumb" name="memberthumb"  onerror="this.src='/profile/profile.png'" src="" style="width:100px; height:100px;  border-radius:70%;" /><br>
        		<input type="file" name="profile" id="profile"/><br>
            <div class="textForm">
                <input type="text" id="name" name="name" class="name" placeholder="이름"><br>
            </div>
            <div class="textForm">
                <input type="text" id="id" name="id" class="id" placeholder="아이디">
            </div>
           	<button type="button" class="btn btn-info" id="memidoverlap">중복</button>
            <div class="textForm">
                <input type="password" class="pw" id="password" name="password" placeholder="비밀번호">
            </div>
            <div class="textForm">
                <input type="password" class="pw" id="password2" name="password2" placeholder="비밀번호 확인">
            </div>
            <div class="textForm">
                <input type="text" class="email" id="email" name="email" placeholder="이메일">
            </div>
            <div class="textForm">
                <input type="text" class="cellphoneNo" id="phone" name="phone" placeholder="전화번호">
            </div>                 
            <div>
                <input type="submit" id="submit" class="btn" value='회원가입'>
            </div>
        </form>
    </div> 
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script>
    	
	    $(function() {
			$('#profile').change(function (event) {
				var reader = new FileReader();
				console.log(event);
				reader.onload = function(e) {
					$('#memberthumb').attr("src", e.target.result);	
				};
				reader.readAsDataURL(event.target.files[0]);
			});
		}); 
    	
    	$('#memidoverlap').click(function () {
    		if($('#id').val()==""){
				alert("아이디를 입력하세요.");
				$('#submit').attr("disabled", true);
				return false;
			} 
			$.ajax({
				type:"post",
				dataType:"text",
				async:false,
				url:"http://localhost:8090/memberoverlap",
				data:{id:$('#id').val()},
				success: function(data, textStatus){
					if(data=="true"){
						alert("사용 불가능합니다.");
						$('#submit').attr("disabled", true);
					} else {
						alert("사용 가능합니다.");
						$('#submit').attr("disabled", false);
					}
				}
			});
    	});

        $('#form').submit(function() {
            let name = $('#name').val();
            if(name=='') {
            	alert("이름을 입력하세요.");
            	$('#name').focus();
            	return false;
            }
        	let id = $('#id').val();
            if(id=='') {
            	alert("아이디를 입력하세요.");
            	$('#id').focus();
            	return false;
            }
            let password1 = $('#password').val();
            if(password1=='') {
            	alert("비밀번호를 입력하세요.");
            	$('#password1').focus();
            	return false;
            }
            let email = $('#email').val();
            if(email=='') {
            	alert("이메일을 입력하세요.");
            	$('#email').focus();
            	return false;
            }
            let phone = $('#phone').val();
            if(phone=='') {
            	alert("전화번호를 입력하세요.");
            	$('#phone').focus();
            	return false;
            }
            let password2 = $('#password2').val();
            if(password1!=password2){
            	alert("비밀번호 확인이 일치하지 않습니다.")
            	$('#password2').focus();
            	return false;
            }
        });
    </script> 
</body>
</html>