<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ User user = new User(1, 'admin', '관리자', 'admin04', 'admin@naver.com', '01085288525', sysdate(), 1, 'ad.jpg'); %> --%>
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
<!-- <script>
	$(function(){
        ClassicEditor.create(document.querySelector("#editor"))
        .then(editor=>{
        	editor.setData('${content}');
        })
        .catch((error) => {
        	console.error(error);
        });
	});
</script> -->
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

.ck-editor__editable {
	min-height: 450px;
	/* min-width: 300px; */
	max-width:100%;
} 

#today_delete, #today_modify, #warning {
	text-decoration: none;
}
#todayboardFooter{
	height : 30px;
	width : 30px;
}
header {
	display: center;
	padding-top: 50px;
	width: 1170px;
}
</style>

</head>
<body>
	<%@include file="header.jsp"%>
	<%-- <%@include file="slides.jsp"%>  --%>


	<div class="container py-5">
		<div class="row">


			<div class="col-lg-1 "></div>
			<!---------------헤더 : 타이틀, 아이디, date, 삭제, 수정, 신고, 조회 -->
			<form action="/today_modify" method="post" enctype="multipart/form-data">
			<div class="col-lg-11 border">
				<header>
			
					<div class="row">
						<div class="container fluid border">
 							<input name="articleNo" id="today_articleNo" type="hidden" value='${todayselect.today_articleNo}'>
							<ul class="list-inline shop-top-menu pb-3 pt-1">
								<li><input name="today_title" id="today_title" size="150"
									value='${todayselect.today_title}'></li>
							</ul>
							<table>
								<tbody class="container mt-1">
									<tr>
										<td><img src="/profileview/${profileImg }" class="userProfile border"></td>
										<td id="user_id" class="col d-flex justify-content-start">${todayselect.user_id}</td>
									
										<td class="col pl-5">	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
								
										<button class="col gap-1 rounded btn btn-white"
											id="today_views" name="today_views"disabled> ${todayselect.today_views}</button></td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="row mt-1">
							<table class="container d-flex">
								<tr>
								<td class="col">${todayselect.today_date}</td>
								<td class="d-flex mt-2" style="display:block;">&nbsp&nbsp&nbsp
										<div id="todayboardFooter" class="todayboardFooter border  d-flex justify-content-center mt-2">
							       			<div id="likes" onclick=changeImg() style="float:left;">				
							       				<c:choose>
													<c:when test="${likes eq true }">
														<img id="like" src="${pageContext.request.contextPath }/images/like.PNG" style="width:50px; " />
													</c:when>
												<c:when test="${likes eq false }">
													<img id="like" src="${pageContext.request.contextPath }/images/nolike.PNG" style="width:50px; " />
												</c:when>
												</c:choose>
											</div>
											<br><hr>
										</div>	
									</td>

									<td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									&nbsp&nbsp&nbsp&nbsp
									<c:choose>
										<c:when test= "${id eq todayselect.user_id || id eq 'admin' }">
											<button type="button" class="col gap-1 rounded btn btn-white"
												id="today_delete" name="today_delete">

												삭제</button>
											<input type="submit" class="col gap-1 rounded btn btn-white"
												id="today_modify" name="today_modify" value="수정"/>
										</c:when>
										<c:otherwise>
										<button type="button" class="col gap-1 rounded btn btn-white"
												id="alerts" name="warning" onclick=alert()>신고</button>

											<button type="button" class="col gap-1 rounded btn btn-white"
												 id="today_list" name="today_list">목록</button>
										</c:otherwise>
									</c:choose>										
								</td>
								</tr>
							</table>
						</div> 	
					</div> 				
				</header>

				<!--------------------------------------------------게시글 ---------------------------- -->
				<main>
					<table class="container-fluid">
						<tr><td>
							<img class="col" src="/thumbfileview/${todayselect.today_thumb}" id="today_thumb" name="today_thumb"
							height="100px" width="100px">
						    <label for="today_file" style="border: solid 1px black;">업로드</label>
    						<input type="file" name="today_file" id="today_file" accept="image/*" style="position:absolute; clip:rect(0, 0, 0, 0);">
							
						</td></tr>		
								
						<tr><td>
						<textarea id="editor" class="ck-editor__editable"name="today_contents" ></textarea>
						</td></tr>
						<tr>
							<td class="d-flex mt-2" style="display:block;">
								<div id="todayboardFooter" class="todayboardFooter   d-flex justify-content-center mt-2">
				       				<div id="likes" onclick=changeImg() style="text-align:center;">				
				       					<c:choose>
											<c:when test="${likes eq true }">
												<img id="like" src="${pageContext.request.contextPath }/images/like.PNG" style="width:50px; " />
											</c:when>
										<c:when test="${likes eq false }">
											<img id="like" src="${pageContext.request.contextPath }/images/nolike.PNG" style="width:50px; " />
										</c:when>
										</c:choose>
									</div>
									<br><hr>
								</div>
								</td>
						</tr>
					</table>
				</main>
			</div>
			</form>
			&nbsp&nbsp&nbsp&nbsp&nbsp

		</div>
	</div>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script>
	//좋아요 user_id , board_type, board_no 
		function changeImg(){
  			$.ajax({
  				type:"post",
  				url:"http://localhost:8090/likes",
  				data: {"user_id": $("#user_id").text(), "board_type" : "today", "board_no": ${todayselect.today_articleNo}},
  				dataType:"text",
  				success:function(data){
  					if(data=="true"){
  						console.log("true: " +data);
  						$("#like").attr("src", "${pageContext.request.contextPath }/images/like.PNG");
  					} else {
  						console.log("false: " + data);
  						$("#like").attr("src", "${pageContext.request.contextPath }/images/nolike.PNG");
  					}
  				}
  			});			 
  		}
	//신고 user_id , board_type, board_no 
	function alert(){
		var alert;
		if($("#alerts").html() == "신고"){
			 alert = confirm('정말 게시글을 신고하시겠습니까?');
		}
		else if($("#alerts").html() == "신고취소"){
			 alert = confirm('게시글을 신고를 취소하시겠습니까?');
		}
		
		if(alert==true){
			$.ajax({
				type:"post",
				url:"http://localhost:8090/alert",
				data: {"user_id": $("#user_id").text(), "board_type" : "today", "board_no": ${todayselect.today_articleNo}},
				dataType:"text",
				success:function(data){
					if(data=="true"){
						$("#alerts span").html("신고취소");
					} else {
						$("#alerts span").html("신고");
					}
				}
			});
		}
	}
  	  </script>
	<script>
	//썸네일 오직 리드만 수행
		$(function() {
			$('#today_file').change(function (event) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#today_thumb').attr("src", e.target.result);	
				};
				reader.readAsDataURL(event.target.files[0]);
			});
		});
		
		 //목록 버튼
	      $(function(){
	    	  $("#today_list").click(function(){
	    	      location.href="/today";
	    	      });
	    	  }); 
		 
	      //ckeditor 작성내용 보여주는부분
  		$(function(){
	      ClassicEditor.create(document.querySelector("#editor"), {
	    	  initialData : '${todayselect.today_contents}',
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
    
	      
	      
  		$(function() {
  			$('#today_delete').click(function (event) {
  			
  				let message = confirm('삭제하시겠습니까?');
  				if(message == false){ 
  					return 
  				}
  			
  				$.ajax({     
  	        		type:"post",
  	        		dataType:"text",
  	        		async:false,
  	        		url:"http://localhost:8090/today_delete",
  	        		data:{"articleNo":${todayselect.today_articleNo}},
  	        		success: function(data, textStatus){ 
  	        			 alert(data);
  	        			 location.href="/today";
  	        		},
  	        		error:function(data, textStatus){
 	        			 alert(data);
  	        		}
  	        	}); 
  			});
  		});
  			
  		

  			
 		/* $(function() {
  			$('#today_modify').click(function (event) {
  				let message = confirm('수정하시겠습니까?');
  				if(message == false){ 
  					return 
  				}
  			
  				$.ajax({     
  	        		type:"post",
  	        		dataType:"text",
  	        		async:false,
  	        		url:"http://localhost:8090/today_modify",
  	        		data:{"articleNo":${todayselect.today_articleNo}},
  	        		success: function(data, textStatus){ 
  	        			 alert(data);
  	        			 location.href="/today";
  	        		},
  	        		error:function(data, textStatus){
 	        			 alert(data);
  	        		}
  	        	}); 
  			});  
 		}); */
	
		</script>
<%-- 	<%@include file="fotter.jsp"%> --%>

</body>
</html>