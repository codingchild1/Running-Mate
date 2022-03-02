<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="js/main.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/29.1.0/classic/ckeditor.js"></script>

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

.container {max-width:1024px; margin:30px auto;}
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

.btn {margin:5px; padding:5px 11px; color:#fff !important; display:inline-block; background-color:#7D7F82; vertical-align:middle; border-radius:0 !important; cursor:pointer; border:none;}
.btn:hover {background: #6b9ab8; }
    

.ck.ck-editor {
	width: 100%;
}

.ck-editor__editable {
	height: 500px;
}
</style>
</head>
<body>

	<%@include file="header.jsp"%>
	<Section>
	<div class="container">
		<h2>게시판 등록</h2>
		<div>
			<div class="writing_title">
				<input type="text" id="title" name="title"
					placeholder="제목을 입력해 주세요." onfocus="this.placeholder=''"
					onblur="this.placeholder='제목을 입력해 주세요.'"
					style="width: 99%; height: 30px; margin: 15px 0 15px 0;" />
			</div>
		</div>
		<!-- <form id="frm" name="frm" method="post" action="/board/insertBoard.do"> -->
			<div class="board_detail">

				<div>
					<div id="classic"></div>
				</div>
			</div>
			<div class="writebtn">
				<button type="button" value="취소" class="btn"
					onclick="location.href='fb_main';">취소</button>
				<button type="submit" value="저장" class="btn">저장</button>
			</div>
		<!-- </form> -->
	</div>
</Section>
	<script>
        ClassicEditor
            .create(document.querySelector('#classic'))
            .catch(error => {
                console.error(error);
            });
    </script>
    
	<%@include file="fotter.jsp"%>
</body>
</html>