<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<title>Insert title here</title>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/32.0.0/classic/ckeditor.js"></script>
<script>
	$(function(){
        ClassicEditor.create(document.querySelector("#editor"))
        .then(editor=>{
        	editor.setData('${content}');
        })
        .catch((error) => {
        	console.error(error);
        });
	});
</script>
<style>
main {
	display: flex;
	justify-content: center;
	float: center;
	width: 1170px;
	height: 600px;
	border: 1px solid red;
	margin-top: 10px;
}

#editor {
	float: right;
}

#today_delete, #today_modify, #warning {
	text-decoration: none;
}

header {
	display: center;
	padding-top: 50px;
	width: 1170px;
}
</style>
<!-- 자바스크립트 -->
</head>
<body>
	<%@include file="header.jsp"%>
	<%@include file="slides.jsp"%>

	<div class="container py-5">
		<div class="row">


			<div class="col-lg-1 "></div>
			<!---------------헤더 : 타이틀, 아이디, date, 삭제, 수정, 신고, 조회 -->
			<div class="col-lg-11 border">
				<header>
					<div class="row">
						<div class="container fluid border">
							<ul class="list-inline shop-top-menu pb-3 pt-1">
								<li>제목<input name="today_title" id="today_title" size="150"
									value='${title }'></li>
							</ul>
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
						</div>

						<div class="row mt-1">
							<table class="container d-flex">
								<td class="col">날짜/시간</td>
								<td class="col pl-5">&nbsp&nbsp
									<button type="button" class="col gap-1 rounded btn btn-white"
										id="today_views" name="today_views" disabled>조회</button>
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

									<button type="button" class="col gap-1 rounded btn btn-white"
										id="today_delete" name="today_delete">삭제</button>
									<button type="button" class="col gap-1 rounded btn btn-white"
										id="today_modify" name="today_modify">수정</button>
									<button type="button" class="col gap-1 rounded btn btn-white"
										id="warning" name="warning">신고</button>
								</td>
							</table>
						</div>
					</div>
				</header>

				<!--------------------------------------------------게시글 ---------------------------- -->
				<main>
					<table class="container-fluid">
						<div id="editor"></div>
						<br>
					</table>
				</main>


				<table>
					<tr>
						<td class="d-flex mt-2"></td>
						<i class="bi bi-heart d-flex justify-content-center mt-2"></i>
					</tr>
				</table>

			</div>

			&nbsp&nbsp&nbsp&nbsp&nbsp

			<!--------------------------------------------------목록---------------------------- -->
			<div style="text-align: right">
				<button class="btn btn-outline-secondary" type="submit"
					style="width: 100px; height: 30px; padding: 5px" id="today_list"
					name="today_list">목록</button>
			</div>

		</div>
	</div>

	<script>
		 //목록 버튼
	      $(function(){
	    	  $("#today_list").click(function(){
	    	      location.href="today";
	    	      });
	    	  });
		 
	      //ckeditor 작성내용 보여주는부분
  		$(function(){
	      ClassicEditor.create(document.querySelector("#editor"))
		     .then(editor=>{
  		editor.setData('${content}');
  		    })
		   .catch((error) => {
		   	console.error(error);
		    });
		});
    
	    	   
	      //수정 버튼
	    	  $(function(){$("#today_modify").click(function(){
	    	      //첨부파일 이름들을 폼에 추가
	    	      var str="";
	    	      $("#uploadedList.file").each(function(i){
	    	          str+=
	    	              "<input type='hidden' name='files["+i+"]' value='"
	    	              +$(this).val()+"'>";
	    	      });
	    	      $("#form1").append(str);
	    	      document.form1.action="${path}/board/update.do";
	    	      document.form1.submit();
	    	      });
	    	  });
	      
	      

	    	   
	    	  //삭제 버튼
	    	  $(function(){$("#today_delete").click(function(){
	    	      if(confirm("삭제하시겠습니까?")){
	    	          document.form1.action="${path}/board/delete.do";
	    	          document.form1.submit();
	    	          }
	    	      });
	    	  });
		</script>
	<%@include file="fotter.jsp"%>

</body>
</html>