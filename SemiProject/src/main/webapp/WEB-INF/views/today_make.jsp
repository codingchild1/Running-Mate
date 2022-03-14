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
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />


<!-- Load fonts style after rendering the layout styles -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">

<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script
	src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<title>Insert title here</title>

<style>
main, header, section {
	display: flex;
	justify-content: center;
	padding-top: 15px;
}

.ck-editor__editable {
	min-height: 550px;
	min-width: 550px;
	max-width:100%;
}
.ck.ck-editor__main>.ck-editor__editable:not(.ck-focused) {
    border-color: var(--ck-color-base-border);
    height: 400px;
}
.ck.ck-editor__editable:not(.ck-editor__nested-editable).ck-focused{
height:400px;
}
.locate {
	position: absolute;
	top: 870px;
}

.userProfile { 
	width:35px;
	height:35px;
	border-radius: 70%;
 }
</style>
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
</script>
</head>
<body>
	<%@include file="header.jsp"%>
	<%-- <%@include file="slides.jsp"%>  --%>



	<div class="container py-5">
		<div class="row">

			<header>
				<ul class="list-inline shop-top-menu pb-3 pt-1">
					<li class="list-inline-item">
							<h1 style="float:left; margin-top:25px; margin-bottom:55px;">오늘의 런닝</h1>
					</li>
				</ul>

				<ul>

				</ul>
			</header>
<%-- 					<table>
						<tbody class="container-fluid mt-1">
							<br>
							<tr>
								<td>
									<img src='/profileview/${user_img2}' class="userProfile"/>
									<input type="hidden"name="user_img" id="user_img" value=''>
								</td>
								<td id="wirte_id" class="col d-flex justify-content-start">
									${wirte_id}
								</td>
							</tr>
						</tbody>
					</table> --%>
					
					<div style="display: flex; margin-left:330px; align-items: center;">
					<span><img class="userProfile" src='/profileview/${user_img2 }'id="user_img2" name="user_img2"></span>
						<input type="hidden"name="user_img" id="user_img" value=''>
					<span><input type="text" id="user_id" name="user_id" value='${wirte_id}'style="height: 20px; border: none; background-color: white;"disabled></span>
						<input type="hidden" id="user_id"name="user_id" value='${wirte_id}'>
				</div>
			<!--------------------------------------------------게시글 ---------------------------- -->
			<main role="main" class="container-fluid">
				<script></script>
				<form name="todaycontents" method="post" action="/today_contents"
					enctype="multipart/form-data">
					<div class="pt-1">
						<input type="text" name="today_title" id="today_title"
							placeholder="제목을 입력하세요"
							style="width: 100%; padding: 5px; border:none; border-bottom:1px solid black;" />
					</div>
					<div></div>

					<img class="col" src="" id="today_thumb" name="today_thumb"
						height="100px" width="100px"> <input type="file"
						name="today_file" id="today_file" />

					<textarea class="ck-editor__editable" name="today_contents"
						id="editor"></textarea>
					<br>

					<!--컨트롤러 제출 today_post 로 이동  -->

					<div class="d-flex justify-content-center">
						<button class="btn btn-outline-secondary" type="submit"
							style="width: 100px; height: 30px; padding: 5px" id="today_post"
							name="today_post">제출</button>
						&nbsp&nbsp&nbsp&nbsp&nbsp


<!-- 						컨트롤러 취소  today_postcancle 로 이동 

						<button class="btn btn-outline-secondary" type="reset"
							style="width: 100px; height: 30px; padding: 5px"
							id="today_postcancle" name="today_postcancle">취소</button>
						&nbsp&nbsp&nbsp&nbsp&nbsp -->


						<!--컨트롤러 목록 today_list 로 이동  -->

						<button class="btn btn-outline-secondary" type="button"
							style="width: 100px; height: 30px; padding: 5px" id="today_list" 
							name="today_list">목록</button>
					</div>
					<br>
				</form>


			</main>
		</div>
	</div>
<%@include file="fotter.jsp"%>

	<script> 
	
	 //목록 버튼
    $(function(){
  	  $("#today_list").click(function(){
  	      location.href="/today";
  	      });
  	  }); 
	 
	 
	$(function() {
		$('#today_file').change(function (event) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#today_thumb').attr("src", e.target.result);	
			};
			reader.readAsDataURL(event.target.files[0]);
		});
	});

	 var src = jQuery('#user_img2').attr("src");
	   $('input[name=user_img]').attr('value',src); 

/* 	$(function('#today') {
		$('#today_postcancle').change(function (event) {
			
	});
		
	$(function() {
		$('#today_list').change(function (event) {
				
	}); */
	
</script>
</body>
</html>