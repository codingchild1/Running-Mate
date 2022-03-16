<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8" />
	
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/templatemo.css">
    <link rel="stylesheet" href="/assets/css/custom.css">
	<link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/templatemo.css">
    <link rel="stylesheet" href="/assets/css/custom.css">
    


	<title>오늘의러닝</title>

	<!-- ckeditor5 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
	
	<style>

	main {
		display: flex;
		justify-content: center;
		float: center;
		width: 1170px;
		height: 600px;
		margin-top: 10px;
	} 

	.ck-editor__editable {
		min-height: 450px;
		/* min-width: 300px; */
		max-width: 100%;
	}
 	#today_title {
 		outline:none;
 		text-decoration: none;
 	}

	#today_delete, #today_modify, #warning, #today_title {
		text-decoration: none;
	}

	#todayboardFooter {
		height: 30px;
		width: 30px;
		display: inline-block;
		margin: 45px 50% 45px 50%;
		float : center;
	}

	header {
		display: center;
		padding-top: 50px;
		width: 1170px;
	}

	.userProfile {
		width: 35px;
		height: 35px;
	border-radius: 70%;
	}

	.undertitleshow{
 		display: inline-block;
 	 	margin: 10px 5% 10px 4%;
 	}
 	  
	</style>

</head>
<body>
	<%@include file="header.jsp"%>
	<%-- <%@include file="slides.jsp"%>  --%>

	<div class="container py-5" style="margin-bottom:400px;" >
		<div class="row">
			<h1 style="float:left; margin-top:25px; margin-bottom:55px;">오늘의 런닝</h1>

			<div class="col-lg-1 "></div>
			<!---------------헤더 : 타이틀, 아이디, date, 삭제, 수정, 신고, 조회 -->
			<form action="/today_modify" method="post" enctype="multipart/form-data">
			<div class="col-lg-11">
				<header>
				<div class="row">
					<div class="container fluid">
						<div style="display: flex; align-items: center;">
							<span><img class="userProfile" src='/profileview/${profileImg }'></span>
							<span><input type="text" id="user_id" name="user_id" value='${todayselect.user_id}' style="height: 20px; border: none; background-color: white;"disabled></span>
						</div>
						<input name="articleNo" id="today_articleNo" type="hidden"value='${todayselect.today_articleNo}'>
						<ul class="list-inline shop-top-menu pb-3 pt-1">
							<li><input name="today_title" id="today_title" size="145" value='${todayselect.today_title}' style="border:none; border-bottom:1px solid black;"></li>
						</ul>
					</div>
					<div class="row">
						<table class="container d-flex">
							<tr>
								<td class="col">${todayselect.today_date}</td>
								<td></td>
								<td id="today_views"  style="color:grey;">${todayselect.today_views}</td>
								<td> 
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
									&nbsp&nbsp
									<c:choose>
										<c:when	test="${id eq todayselect.user_id || adminCheck eq 1 }">
											<button type="button" class="col gap-1 rounded btn btn-white" id="today_delete" name="today_delete">삭제</button>
										<c:if test="${id eq todayselect.user_id}">
											<input type="submit" class="col gap-1 rounded btn btn-white" id="today_modify" name="today_modify" value="수정" />
										</c:if>
										</c:when>
										<c:otherwise>
											<span id="alerts" onclick=alert()>
											<c:choose>
												<c:when test="${empty id}" ></c:when>
												<c:when test="${alert eq true }">
													<span id="alert" style="float: right; padding-left: 10px;">신고취소</span>
												</c:when>
												<c:when test="${alert eq false }">
													<span id="alert" style="float: right; padding-left: 10px;">신고</span>
												</c:when>
											</c:choose>
											</span>
											<span id="today_list" onclick=today_list()>목록</span>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</table>
					</div>
				</div>
				</header>

				<!------------------------ 게시글 ---------------------------- -->
				<main>
					<table class="container-fluid">
						<tr>
							<td>
								<img class="col" src="/thumbfileview/${todayselect.today_thumb}" id="today_thumb" name="today_thumb" height="100px" width="100px"> 
								<label for="today_file">업로드</label> 
								<input type="file"name="today_file" id="today_file" accept="image/*" style="position: absolute; clip: rect(0, 0, 0, 0);">
							</td>
						</tr>
						<tr>
							<td><textarea id="editor" class="ck-editor__editable" name="today_contents"></textarea></td>
						</tr>
						<tr>
							<td class="mt-2">
								<div id="todayboardFooter"	class="todayboardFooter" >
									<div id="likes" onclick=changeImg()>
									<c:choose>
										<c:when test="${empty id}" ></c:when>
										<c:when test="${likes eq true }" >
											<img id="like"	src="${pageContext.request.contextPath }/images/like.PNG" style="width: 35px;" />
										</c:when>
										<c:otherwise>
											<img id="like" src="${pageContext.request.contextPath }/images/nolike.PNG" style="width: 35px;" />
										</c:otherwise>
									</c:choose>
									</div><br>
								</div>
							</td>
						</tr>
					</table>
				</main>
				</div>
			</form>
			&nbsp&nbsp&nbsp&nbsp&nbsp
			<input type="hidden" id="sessionid" value="${id }"/>
			<input type="hidden" id="sessionid" value="${id }"/>
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	<script>
	  function today_list(){
		  location.href="/today";	  
	  }
  	 
	//좋아요 user_id , board_type, board_no 
	function changeImg(){
  		$.ajax({
  			type:"post",
  			url:"http://localhost:8090/likes",
  			data: {"user_id": $("#writerId").text(), "board_type" : "today", "board_no": ${todayselect.today_articleNo}},
  			dataType:"text",
  			success:function(data){
  				if(data=="true"){
  					$("#like").attr("src", "${pageContext.request.contextPath }/images/like.PNG");
  				} else {
  					$("#like").attr("src", "${pageContext.request.contextPath }/images/nolike.PNG");
  				}
  					/* 새로고침 window.location.reload(); */
  			}
  		});			 
  	}
	//신고 user_id , board_type, board_no 
	function alert(){
		var alert;
		if($("#alert").html() == "신고"){
			 alert = confirm('정말 게시글을 신고하시겠습니까?');
		}
		else if($("#alert").html() == "신고취소"){
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
						$("#alert").html("신고취소");
					} else {
						$("#alert").html("신고");
					}
				}
			});
		}
	}
  	</script>
	<script>
 	$(function(){
		//목록버튼
		$("#today_list").click(function(){
	    		location.href="/today";
	    });
 	    	  
 	    //썸네일 이미지만 리드 
 	    $('#today_file').change(function (event) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#today_thumb').attr("src", e.target.result);	
			};
			reader.readAsDataURL(event.target.files[0]);
		});
 	   
 	    //ckeditor5 실행  
	    if($("#sessionid").val()==$("#user_id").val() || $("#user_id").val() == "admin"){
 	    	ClassicEditor.create(document.querySelector("#editor"), {
  		    	initialData : '${todayselect.today_contents}',
  		    	ckfinder : {
  	          		uploadUrl : "/upload"
  	          	}
			}).then(editor=> {
  	      		window.editor=editor;
  	      	}).catch((error) => {
  				console.error(error);
  				});
 	    } else {
 	    	$('#today_title').attr('readOnly', true);
 	    	$('#today_file').attr('disabled', 'disabled'); 	    		 
 	    	ClassicEditor.create(document.querySelector("#editor"), {
 	  			initialData : '${todayselect.today_contents}',
 	  		    ckfinder : {
 	  	       		uploadUrl : "/upload"
 	  	        }
 	  		}).then(editor=> {
	    		editor.ui.view.toolbar.element.style.display = 'none';
			});
 	    }
 	    
	    $('#today_delete').click(function (event) {
			let message = confirm('삭제하시겠습니까?');
			if(message == false){ 
				return;
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
	      
	</script>
		
	 <%@include file ="fotter.jsp" %> 

</body>
</html>