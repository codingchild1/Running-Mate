<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>탈퇴 화면</title>
    
    <style type="text/css">
        table{
            margin-left:auto; 
            margin-right:auto;
            border:3px solid skyblue;
        }
        
        td{
            border:1px solid skyblue
        }
        
        #title{
            background-color:skyblue
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
    <b><font size="6" color="gray">내 정보</font></b>
 	<!-- 회원은 삭제되는데 유효성 검사가 안 됨 -->
    <form name="deleteform" method="post" action="delete" onsubmit="return checkValue()">
 
        <table>
            <tr>
                <td bgcolor="skyblue">비밀번호</td>
                <td><input type="text" id="password" name="password"></td>
            </tr>
        </table>
        
        <br> 
        <input type="button" value="취소" onclick="history.go(-1)">
        <input type="submit" value="탈퇴" /> 
    </form>

</body>
</html>