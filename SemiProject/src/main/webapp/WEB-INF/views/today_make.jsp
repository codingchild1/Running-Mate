<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />


<link rel="apple-touch-icon" href="assets/img/apple-icon.png">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">



<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">

<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>Insert title here</title>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<style>
main, header {
	display: flex;
	justify-content: center;
	padding-top: 50px;
}

.ck-editor__editable {
	min-height: 550px;
}

.locate {
	position: absolute;
	top: 870px;
}
</style>
</head>
<body>
<%@include file ="header.jsp" %>
<%@include file ="slides.jsp" %>

	<section class="container pt-1">
		<div class="row col">
			<header>
				<ul class="list-inline shop-top-menu pb-3 pt-1">
					<li class="list-inline-item">${today_title}
						<h1 class="display-5 fw-bold" style="align-text: left;">오늘의런닝</h1>
					</li>
				</ul>
				
				<ul>
					<table>
						<tbody class="container mt-1">
							<tr>
								<td><img
									src="${pageContext.request.contextPath}/resources/img/1.gif"
									class="col" /></td>
								<td id="user_id" class="col d-flex justify-content-start">아이디</td>

							</tr>
						</tbody>
					</table>
				</ul>
			</header>

			<main role="main" class="container">
				<form name="todaycontentsform" method="post" action="">
					<div class="pt-1">
						<input type="text" name="title" placeholder="제목을 입력하세요"
							style="border-radius: 5px; width: 100%; padding: 5px" />
					</div>
				
					<div class="pt-1">
						<!-- 2. TEXT 편집 툴을 사용할 textarea -->
						<form method = "post" action = "today_post" method="">
						<textarea name="today_contents" id="editor"></textarea>
					</div>
				</form>
				<br>
				<div class="pt-1 locate">
					<div class="d-flex justify-content-center">
					<form action ="/today" method="post" style="display:inline-block"><button id="routes_all">전체보기</button></form>
						<button class="btn btn-outline-secondary" type="submit"
							style="width: 100px; height: 30px; padding: 5px"
							id="today_makeSubmit" name="today_makeSubmit" onClick="alert(myClassicEditor.getData())">
							제출</button>
					</form>&nbsp&nbsp&nbsp&nbsp&nbsp
							
						<form action ="/today_postcancle" method="post">	
						<button class="btn btn-outline-secondary" type="submit"
							style="width: 100px; height: 30px; padding: 5px"
							id="today_makeCancle" name="today_makeCancle">
							취소</button>&nbsp&nbsp&nbsp&nbsp&nbsp
						</form>	
						
						<form action ="/today_list" method="post">	
						<button class="btn btn-outline-secondary" type="submit"
							style="width: 100px; height: 30px; padding: 5px"
							id="today_list" name="today_list">
							목록</button>
						</form>
					</div>
				</div>
					

	 <script>
        // 3. CKEditor5를 생성할 textarea 지정
        var myClassicEditor;
        ClassicEditor.create(document.querySelector("#editor"),{
        	ckfinder :{
        		uploadUrl:'http://localhost:8090/today_make'
        	}
        }).then(ediotr => {
        	window.editor = editor
        }).then(editor=>{myClassicEditor = editor
        }).catch((error) => {console.error(error);});
        
        $(function(){
        	//id가 content인 부분을 대체 시킴
        	   var ck = CKEDITOR.replace("content",{
        		   //파일 업로드 주소
               	filebrowerUploadUrl:"${pageContext.request.contextPath}/resources/ckeditor/ck_upload"
     		   });
        });

      </script>
      <script>
      
      ClassicEditor
      $(document).ready(function(){
  	    $('#editor').ckeditor(function(){
  	        var editor = $('#editor').ckeditorGet();

  	        // Capturando o conteúdo do editor
  	        var data = $('#editor').val();
  	        // Adicionando conteúdo ao editor
  	        $.get("today_make").done(function (data) {
  	            // Do something with the data
  	            $('#editor').val(data);
  	        });
  	        console.log(editor)
  	    },
  	    {
  	        width: 780,
  	        height: 350
  	    });
  	});
      
      </script>
	
			</main>
		</div>
	</section>
 <%@include file ="fotter.jsp" %>
</body>
</html>