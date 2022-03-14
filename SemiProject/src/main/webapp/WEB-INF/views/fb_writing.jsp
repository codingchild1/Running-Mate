<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/main.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script	src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>

<title>글 쓰기</title>

<style>
       html{overflow:scorll;}
h1, h2, a, form, table, caption, thead, tbody, tr, th, td, submit {
	margin:0; outline:0; border:0; padding:0; font-size:100%; vertical-align:baseline; background:transparent;
}
h1, h2, h3 {font-size: 1.5em;}
p{margin:0; padding:0;}
input{vertical-align:middle;}
input:focus {outline:0;}
caption {display:none; width:0; height:0; margin-top:-1px; overflow:hidden; visibility:hidden; font-size:0; line-height:0;}

.container2 {max-width:1024px; margin:30px auto;}
.board_list {width:100%; border-top:2px solid #252525; border-bottom:1px solid #ccc; margin:15px 0; border-collapse: collapse;}
.board_list thead th:first-child {background-image:none;}
.board_list thead th {border-bottom:1px solid #ccc; padding:13px 0; color:#3b3a3a; text-align: center; vertical-align:middle;}
.board_list tbody td {border-top:1px solid #ccc; padding:13px 0; text-align:center; vertical-align:middle;}
.board_list tbody tr:first-child td {border:none;}
.board_list tbody tr:hover{background:#ffff99;} 
.board_list tbody td.title {text-align:center ; padding-left:20px; padding-right: 18px;}
.board_list tbody td a {display:inline-block}

.board_detail {width:100%; border-top:2px solid #252525; border-bottom:1px solid #ccc; border-collapse:collapse;}
.board_detail tbody input {width:100%;}
.board_detail tbody th {text-align:left; background:#f7f7f7; color:#3b3a3a; vertical-align:middle; text-align: center;}
.board_detail tbody th, .board_detail tbody td {padding:10px 15px; border-bottom:1px solid #ccc;}
.board_detail tbody textarea {width:100%; min-height:500px}

.btn2 {margin:5px; padding:5px 11px; color:#fff !important; display:inline-block; background-color:#7D7F82; vertical-align:middle; border-radius:0 !important; cursor:pointer; border:none;}
.btn2:hover {background: #6b9ab8; }
a { text-decoration-line: none;}
    
.ck.ck-reset.ck-editor.ck-rounded-corners {
    		width: 100%;
		}

.ck-editor__editable {
    min-height: 700px;
}



</style>
</head>
<body>

	<%@include file="header.jsp"%>
	<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
	<main style="width: 50%; margin: 0 auto;">
	<div class="container" style="padding-top: 1em;">
		<h2>게시판 등록</h2>
		<form action="/fb_write" method="post" >
		<!-- 이거 없으면 에러남 -->
		
		<div>
		<img src='/profileview/${user_img2}' class="col" />
		<input type="hidden"name="user_img" id="user_img" value=''>
			<div class="writing_title">
				<input type="text" id="title" name="fb_title"
					placeholder="제목을 입력해 주세요." onfocus="this.placeholder=''"
					onblur="this.placeholder='제목을 입력해 주세요.'"
					style="width: 100%; height: 30px; margin: 15px 0 15px 0;" />
			</div>
		</div>
		
			<div class="board_detail">
					<textarea  id="editor" name="fb_content"></textarea>
			</div>
			<div class="writebtn">
				<input type="submit" value="저장" class="btn btn-success"/>
				<input type="button" value="취소" class="btn btn-success"
					onclick="location.href='fb_main';"/>				
			</div>
		</form>
	</div>
</main>
	<script>
	
	
	$(function(){
        ClassicEditor
        	.create(document.querySelector("#editor"), {
        		ckfinder : {
        			uploadUrl : "/upload"
        		}
        	}).then(editor=> {
        		window.editor=editor;
        	})
        	.catch((error) => {
        		console.error(error);
        	});
	});
	
	 var src = jQuery('#user_img2').attr("src");
	   $('input[name=user_img]').attr('value',src); 
    </script>
    
	<%@include file="fotter.jsp"%>
</body>
</html>